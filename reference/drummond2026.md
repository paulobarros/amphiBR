# Brazilian Amphibian Species List Dataset (2026)

The 2026 edition of the official Brazilian Amphibian Species List
published by the Brazilian Herpetological Society (SBH), by Drummond et
al. (2026), with the national threat category of each species according
to the Portaria MMA nº 1.704/2026.

## Usage

``` r
drummond2026
```

## Format

### `drummond2026`

A data frame with 1,251 rows and 11 columns:

- species_id:

  Id of species in list

- order:

  Taxonomic Order

- family:

  Taxonomic Family

- subfamily:

  Taxonomic Subfamily

- tribe:

  Taxonomic Tribe (Hylidae only)

- genus:

  Genus

- epithet:

  Specific epithet

- species:

  Scientific name

- author:

  Authorship of original description

- status:

  Change relative to Segalla et al. (2021), see details

- category:

  Threat category by Portaria MMA 1.704/2026, see details

## Source

<https://zenodo.org/records/18340087> (CC BY 4.0) and
<https://www.in.gov.br/en/web/dou/-/portaria-mma-n-1.704-de-16-de-junho-de-2026-712968917>

## Details

The list includes 1,206 Anura, 40 Gymnophiona and 5 Caudata species (125
genera, 28 families), with records in Brazil up to 12 March 2026.
Compared to Segalla et al. (2021), 41 species were removed and 104 were
added. The `status` column records the change for each species:
"recently described species" (75 species described since 2021),
"taxonomic change or new record" (29 species added by revalidation,
removal from synonymy or new records in Brazil) and "new combination"
(63 species moved to another genus, such as *Scinax* to *Ololygon* and
*Julianus*, or *Lysapsus* to *Pseudis*). The full list of changes,
including the removed species, is in `data-raw/mudancas_2021_2026.csv`
in the package source.

In Hylidae, the subfamily is Hylinae and the tribes (Cophomantini,
Dendropsophini, ...) are in `tribe`. In `segalla2021` these groups are
in the `subfamily` column.

`category` follows Annex I (CR, EN, VU, "CR (PE)" = possibly extinct)
and Annex II (EX = extinct) of the Portaria MMA nº 1.704, de 16 de junho
de 2026 (DOU 17/06/2026). The Portaria lists only threatened and extinct
species, so `NA` means the species is not on those lists (it includes
LC, NT and DD species and species not yet assessed). Names are matched
exactly; the Portaria also lists *Bokermannohyla napolii* (VU), now a
junior synonym of *B. ravida*, and that category is not transferred.

## References

Drummond, L.O., Santana, D.J., Lima, A.P. & Toledo, L.F. (2026). List of
Amphibians of Brazil. Herpetologia Brasileira, 15(2).
[doi:10.5281/zenodo.18340087](https://doi.org/10.5281/zenodo.18340087)
