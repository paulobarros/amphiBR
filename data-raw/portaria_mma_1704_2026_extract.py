"""
Extracts the amphibians listed in Portaria MMA n. 1.704, de 16 de junho de
2026 (Lista Nacional Oficial das Especies da Fauna Ameacadas de Extincao,
Annex I, and Lista Nacional Oficial das Especies da Fauna Extintas, Annex II)
from the official text published in the Diario Oficial da Uniao
(DOU 17/06/2026, Edicao 111-B, Secao 1 - Extra B, p. 15).

Usage (from the package root, Python standard library only):
    curl -L -A Mozilla/5.0 -o data-raw/portaria_mma_1704_2026.html "<URL>"
    python data-raw/portaria_mma_1704_2026_extract.py

The DOU server often refuses requests that do not look like a browser, so
the page is read from the local copy saved by the command above (URL below).

Writes data-raw/portaria_mma_1704_2026_amphibia.csv
"""

import csv
import os
import sys
from html.parser import HTMLParser

URL = ("https://www.in.gov.br/en/web/dou/-/"
       "portaria-mma-n-1.704-de-16-de-junho-de-2026-712968917")
HERE = os.path.dirname(os.path.abspath(__file__))
HTML = os.path.join(HERE, "portaria_mma_1704_2026.html")
OUT = os.path.join(HERE, "portaria_mma_1704_2026_amphibia.csv")


class Tables(HTMLParser):
    def __init__(self):
        super().__init__()
        self.tables, self.row, self.cell = [], None, None

    def handle_starttag(self, tag, attrs):
        if tag == "table":
            self.tables.append([])
        elif tag == "tr":
            self.row = []
        elif tag == "td":
            self.cell = ""

    def handle_endtag(self, tag):
        if tag == "td":
            self.row.append(" ".join(self.cell.split()))
            self.cell = None
        elif tag == "tr":
            self.tables[-1].append(self.row)

    def handle_data(self, data):
        if self.cell is not None:
            self.cell += data


def main():
    if not os.path.exists(HTML):
        sys.exit(f'Save the DOU page first:\n'
                 f'  curl -L -A Mozilla/5.0 -o {HTML} "{URL}"')
    with open(HTML, encoding="utf-8") as f:
        page = f.read()
    parser = Tables()
    parser.feed(page)
    rows = []
    for table in parser.tables:
        header = table[0]
        annex = "II" if any("extin" in h.lower() for h in header) else "I"
        for r in table:
            # N, new listing (*), group, class, order, family, taxon, category
            if len(r) >= 8 and r[3] == "Amphibia":
                rows.append({"annex": annex, "new_listing": r[1] == "*",
                             "order": r[4], "family": r[5],
                             "species": r[6], "category": r[7]})
    with open(OUT, "w", newline="", encoding="utf-8") as f:
        w = csv.DictWriter(f, fieldnames=list(rows[0]))
        w.writeheader()
        w.writerows(rows)
    print(len(rows), "amphibian taxa")


if __name__ == "__main__":
    main()
