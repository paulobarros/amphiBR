# amphiBR 0.1.0

* New dataset `drummond2026`, with the 2026 edition of the List of Amphibians
  of Brazil (Drummond, Santana, Lima & Toledo 2026, *Herpetologia Brasileira*
  15(2), <https://doi.org/10.5281/zenodo.18340087>): 1,251 species (1,206
  Anura, 40 Gymnophiona, 5 Caudata).
* `drummond2026$category` gives the national threat category by the
  Portaria MMA nº 1.704, de 16 de junho de 2026 (Annexes I and II).
* `drummond2026$status` records the change of each species relative to
  Segalla et al. (2021); `data-raw/mudancas_2021_2026.csv` lists all changes,
  including the 41 removed species (25 without confirmed records in Brazil and
  16 junior synonyms) and 63 new combinations.
* `data-raw/` has the scripts that extract the list from the original PDF and
  the Portaria from the Diário Oficial da União, and build the dataset.
* `segalla2021` is unchanged.
