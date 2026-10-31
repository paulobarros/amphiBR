"""
Extracts the List of Amphibians of Brazil (Drummond et al. 2026) from the
original PDF published on Zenodo and writes data-raw/drummond2026.csv.

Source: Drummond, L.O., Santana, D.J., Lima, A.P. & Toledo, L.F. (2026).
List of Amphibians of Brazil. Herpetologia Brasileira 15(2).
https://doi.org/10.5281/zenodo.18340087 (CC BY 4.0)

Usage (from the package root):
    python -m pip install pdfplumber
    python data-raw/drummond2026_extract.py

Notes
- The PDF is a two-column layout; each column is read separately.
- Species names are the italic text of each bullet entry; the rest is the
  authorship. Figure call-outs such as "(Fig. 2A)" are removed.
- Entries printed in red in the PDF are new relative to Segalla et al. (2021)
  (see section D of the article). This is stored in the column `new_2026`.
- Heading counts "(genera/species)" are checked against the parsed rows.
"""

import csv
import hashlib
import os
import re
import sys
import urllib.request

import pdfplumber

URL = ("https://zenodo.org/api/records/18340087/files/"
       "HB-Lista-Anfibios-Drummond-etal-2026.pdf/content")
MD5 = "1002352b0478baff9259e5f28b0410f1"
HERE = os.path.dirname(os.path.abspath(__file__))
PDF = os.path.join(HERE, "HB-Lista-Anfibios-Drummond-etal-2026.pdf")
OUT = os.path.join(HERE, "drummond2026.csv")

RED = (0.0, 0.95, 0.91, 0.0)
HEADING = re.compile(r"^([A-Za-z]+|incertae sedis) \((\d+)/(\d+)\)$")
# Typographical slips in the printed authorships (checked against the
# rendered PDF and Segalla et al. 2021). Everything else is kept as printed.
CORRECTIONS = {
    "Anomaloglossus baeobatrachus": "(Boistel & de Massari, 1999)",
    "Ischnocnema verrucosa": "(Reinhardt & Lütken, 1862)",
    "Dendrophryniscus brevipollicatus": "Jiménez de la Espada, 1870",
    "Melanophryniscus atroluteus": "(Miranda-Ribeiro, 1920)",
    "Oreobates heterodactylus": "(Miranda-Ribeiro, 1937)",
    "Adelphobates castaneoticus": "(Caldwell & Myers, 1990)",
    "Adelphobates quinquevittatus": "(Steindachner, 1864)",
    "Adenomera engelsi": "Kwet, Steiner & Zillikens, 2009",
}
FIG = re.compile(r"\s*\(Fig\.? ?\d[A-Z]\)\s*")


def download():
    if not os.path.exists(PDF):
        urllib.request.urlretrieve(URL, PDF)
    with open(PDF, "rb") as f:
        md5 = hashlib.md5(f.read()).hexdigest()
    if md5 != MD5:
        sys.exit(f"Checksum mismatch: {md5} != {MD5}")


def rank(name):
    if name == "incertae sedis":
        return "tribe"
    if name.isupper():
        return "order" if name != "AMPHIBIA" else "class"
    if name.endswith("idae"):
        return "family"
    if name.endswith("inae"):
        return "subfamily"
    if name.endswith("ini"):
        return "tribe"
    raise ValueError(name)


def lines(pdf):
    """Yield text lines (with chars) in reading order, body text only."""
    for page in pdf.pages:
        mid = page.width / 2
        for x0, x1 in [(0, mid), (mid, page.width)]:
            crop = page.crop((x0, 90, x1, 800))
            for ln in crop.extract_text_lines(return_chars=True):
                if ln["text"].startswith("ACKNOWLEDGMENTS"):
                    yield "ACKNOWLEDGMENTS", []
                    return
                chars = [c for c in ln["chars"] if c["text"].strip()]
                # body text is 10 pt; captions are 9 pt, section titles 11 pt
                if chars and all(abs(c["size"] - 10) < 0.2 for c in chars):
                    yield ln["text"].strip(), ln["chars"]


def main():
    download()
    pdf = pdfplumber.open(PDF)
    started = False
    ctx = {"order": None, "family": None, "subfamily": None, "tribe": None}
    heads = []      # (rank, name, n_genera, n_species)
    entries = []    # dicts with ctx + chars
    for text, chars in lines(pdf):
        if not started:
            started = text.startswith("AMPHIBIA (")
            continue
        if text.startswith("ACKNOWLEDGMENTS"):
            break
        m = HEADING.match(text)
        if m and not text.startswith("•"):
            r = rank(m.group(1))
            name = m.group(1).capitalize() if r == "order" else m.group(1)
            # "incertae sedis" (genus not assigned to a tribe) -> NA
            ctx[r] = None if name == "incertae sedis" else name
            if r == "order":
                ctx.update(family=None, subfamily=None, tribe=None)
            elif r == "family":
                ctx.update(subfamily=None, tribe=None)
            elif r == "subfamily":
                ctx.update(tribe=None)
            heads.append((r, name, int(m.group(2)), int(m.group(3))))
            continue
        if text.startswith("•"):
            entries.append(dict(ctx, chars=[], lines=[]))
        entries[-1]["chars"].extend(chars)
        entries[-1]["lines"].append(text)

    rows = []
    for e in entries:
        chars = [c for c in e["chars"] if c["text"] != "•"]
        ink = [c for c in chars if c["text"].strip()]
        n_red = sum(tuple(round(v, 2) for v in c["non_stroking_color"]) == RED
                    for c in ink)
        full = ""
        for i, ln in enumerate(e["lines"]):
            ln = ln.lstrip("•").strip()
            if full.endswith("-") or not full:
                full += ln
            else:
                full += " " + ln
        # binomial = first two words; they must be printed in italics
        # genera of uncertain placement are printed in quotes ("Hyla");
        # quotes are dropped, as in segalla2021
        full = re.sub("[“”\"]", "", full)
        m = re.match(r"([A-Z][a-z]+ [a-z-]+)\s+", full)
        if m is None:
            sys.exit("cannot parse entry: " + full)
        species, cut = m.group(1), m.end()
        author = FIG.sub(" ", full[cut:]).strip()
        author = CORRECTIONS.get(species, author)
        genus, epithet = species.split(" ")
        rows.append({
            "order": e["order"], "family": e["family"],
            "subfamily": e["subfamily"], "tribe": e["tribe"],
            "genus": genus, "epithet": epithet, "species": species,
            "author": author,
            "new_2026": n_red > len(ink) / 2,
        })

    # check heading counts against parsed rows. Three subtotals printed in the
    # PDF are one species short of the entries listed under them (the class
    # and order totals, 1251 = 1206 + 5 + 40, match the entries).
    misprints = {"Aromobatidae": 46, "Brachycephalidae": 83,
                 "Pristimantinae": 45}
    for r, name, ng, ns in heads:
        if r == "class":
            sub = rows
        elif name == "incertae sedis":
            continue
        else:
            sub = [x for x in rows if x[r] == name]
        got_s = len(sub)
        got_g = len({x["genus"] for x in sub})
        if misprints.get(name) == ns and got_s == ns + 1 and got_g == ng:
            print(f"{name}: PDF heading says {ns} species, {got_s} listed")
        elif (got_g, got_s) != (ng, ns):
            sys.exit(f"count mismatch {r} {name}: PDF {ng}/{ns}, "
                     f"parsed {got_g}/{got_s}")
    print(f"{len(rows)} species ({sum(x['new_2026'] for x in rows)} in red); "
          f"{len(heads)} headings checked")

    with open(OUT, "w", newline="", encoding="utf-8") as f:
        w = csv.DictWriter(f, fieldnames=list(rows[0]))
        w.writeheader()
        w.writerows(rows)


if __name__ == "__main__":
    main()
