#' Brazilian Amphibian Species List Dataset
#'
#' A dataset of the official Brazilian Amphibian Species List publish
#' by the Brazilian Herpetological Society (SBH) with species conservation
#' status category, State and Biome Level occurrence data, endemism and common names by MMA 300/2022, Tadpoles description by
#' Brazilian Tadpole Database (Provete et al.,2012).
#'
#' @format ## `segalla2021`
#' A data frame with 1,188 rows and 10 columns:
#' \describe{
#'  \item{species_id}{Id of species in list}
#'   \item{order}{Taxonomic Order}
#'   \item{family}{Taxonomic Family}
#'   \item{subfamily}{Taxonomic Family}
#'   \item{genus}{Genus}
#'   \item{epithet}{Specifc epithet}
#'   \item{species}{Scientific name}
#'   \item{author}{Authorship of original description}
#'   \item{status}{General remarks about species in list}
#'   \item{common_name_br}{Common name in Brazil, if exists}
#'   \item{category}{Conservation Status Assessment by MMA 300/2022}
#'   \item{endemic_br}{Endemic of Brazil}
#'   \item{AC-TO}{Species occurrence at State level, see details}
#'   \item{AF-UNK}{Species occurence at Biome level, see details}
#'   \item{tad_ext_morph}{Description of External morphology of larvae/tadpole}
#'   \item{tad_int_oral_feat}{Description of internal oral features of larvae/tadpole}
#'   \item{tad_chond}{Description of chondocranium features of larvae/tadpole}
#'   ...
#' }
#'
#' @details
#' The occurrence data is is binary format (1/0) at State Level is provided by the MMA evaluation of amphibians species in Brazil. AC=Acre,
#' AL=Alagoas,AP=Amapá,AM=Amazonas,BA=Bahia,CE=Ceará,DF=Distrito Federal,ES=Espírito Santo,GO=Goiás,MA=Maranhão,MT=Mato Grosso,MS=Mato Grosso do Sul,
#' MG=Minas Gerais,PA=Pará,PB=Paraíba,PR=Paraná,PE=Pernambuco,PI=Piauí,RJ=Rio de Janeiro,RN=Rio Grande do Norte,RS=Rio Grande do Sul,RO=Rondônia,RR=Roraima,SC=Santa Catarina,
#' SP=São Paulo,SE=Sergipe,TO=Tocantins.
#'
#'
#'
#'
#' @source <https://zenodo.org/record/4716176>
"segalla2021"

#' Brazilian Amphibian Species List Dataset (2026)
#'
#' The 2026 edition of the official Brazilian Amphibian Species List published
#' by the Brazilian Herpetological Society (SBH), by Drummond et al. (2026),
#' with the national threat category of each species according to the
#' Portaria MMA nº 1.704/2026.
#'
#' @format ## `drummond2026`
#' A data frame with 1,251 rows and 11 columns:
#' \describe{
#'   \item{species_id}{Id of species in list}
#'   \item{order}{Taxonomic Order}
#'   \item{family}{Taxonomic Family}
#'   \item{subfamily}{Taxonomic Subfamily}
#'   \item{tribe}{Taxonomic Tribe (Hylidae only)}
#'   \item{genus}{Genus}
#'   \item{epithet}{Specific epithet}
#'   \item{species}{Scientific name}
#'   \item{author}{Authorship of original description}
#'   \item{status}{Change relative to Segalla et al. (2021), see details}
#'   \item{category}{Threat category by Portaria MMA 1.704/2026, see details}
#' }
#'
#' @details
#' The list includes 1,206 Anura, 40 Gymnophiona and 5 Caudata species
#' (125 genera, 28 families), with records in Brazil up to 12 March 2026.
#' Compared to Segalla et al. (2021), 41 species were removed and 104 were
#' added. The `status` column records the change for each species:
#' "recently described species" (75 species described since 2021),
#' "taxonomic change or new record" (29 species added by revalidation,
#' removal from synonymy or new records in Brazil) and "new combination"
#' (63 species moved to another genus, such as *Scinax* to *Ololygon* and
#' *Julianus*, or *Lysapsus* to *Pseudis*). The full list of changes,
#' including the removed species, is in `data-raw/mudancas_2021_2026.csv`
#' in the package source.
#'
#' In Hylidae, the subfamily is Hylinae and the tribes (Cophomantini,
#' Dendropsophini, ...) are in `tribe`. In `segalla2021` these groups are in
#' the `subfamily` column.
#'
#' `category` follows Annex I (CR, EN, VU, "CR (PE)" = possibly extinct) and
#' Annex II (EX = extinct) of the Portaria MMA nº 1.704, de 16 de junho de 2026
#' (DOU 17/06/2026). The Portaria lists only threatened and extinct species,
#' so `NA` means the species is not on those lists (it includes LC, NT and DD
#' species and species not yet assessed). Names are matched exactly; the
#' Portaria also lists *Bokermannohyla napolii* (VU), now a junior synonym of
#' *B. ravida*, and that category is not transferred.
#'
#' @references
#' Drummond, L.O., Santana, D.J., Lima, A.P. & Toledo, L.F. (2026). List of
#' Amphibians of Brazil. Herpetologia Brasileira, 15(2).
#' \doi{10.5281/zenodo.18340087}
#'
#' @source <https://zenodo.org/records/18340087> (CC BY 4.0) and
#'   <https://www.in.gov.br/en/web/dou/-/portaria-mma-n-1.704-de-16-de-junho-de-2026-712968917>
"drummond2026"
