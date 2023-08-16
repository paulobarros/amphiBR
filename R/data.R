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
