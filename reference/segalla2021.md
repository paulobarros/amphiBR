# Brazilian Amphibian Species List Dataset

A dataset of the official Brazilian Amphibian Species List publish by
the Brazilian Herpetological Society (SBH) with species conservation
status category, State and Biome Level occurrence data, endemism and
common names by MMA 300/2022, Tadpoles description by Brazilian Tadpole
Database (Provete et al.,2012).

## Usage

``` r
segalla2021
```

## Format

### `segalla2021`

A data frame with 1,188 rows and 10 columns:

- species_id:

  Id of species in list

- order:

  Taxonomic Order

- family:

  Taxonomic Family

- subfamily:

  Taxonomic Family

- genus:

  Genus

- epithet:

  Specifc epithet

- species:

  Scientific name

- author:

  Authorship of original description

- status:

  General remarks about species in list

- common_name_br:

  Common name in Brazil, if exists

- category:

  Conservation Status Assessment by MMA 300/2022

- endemic_br:

  Endemic of Brazil

- AC-TO:

  Species occurrence at State level, see details

- AF-UNK:

  Species occurence at Biome level, see details

- tad_ext_morph:

  Description of External morphology of larvae/tadpole

- tad_int_oral_feat:

  Description of internal oral features of larvae/tadpole

- tad_chond:

  Description of chondocranium features of larvae/tadpole

## Source

<https://zenodo.org/record/4716176>

## Details

The occurrence data is is binary format (1/0) at State Level is provided
by the MMA evaluation of amphibians species in Brazil. AC=Acre,
AL=Alagoas,AP=Amapá,AM=Amazonas,BA=Bahia,CE=Ceará,DF=Distrito
Federal,ES=Espírito Santo,GO=Goiás,MA=Maranhão,MT=Mato Grosso,MS=Mato
Grosso do Sul, MG=Minas
Gerais,PA=Pará,PB=Paraíba,PR=Paraná,PE=Pernambuco,PI=Piauí,RJ=Rio de
Janeiro,RN=Rio Grande do Norte,RS=Rio Grande do
Sul,RO=Rondônia,RR=Roraima,SC=Santa Catarina, SP=São
Paulo,SE=Sergipe,TO=Tocantins.
