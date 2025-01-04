#' Brazilian Amphibian Species List Dataset
#'
#' A dataset of the official Brazilian Amphibian Species List publish
#' by the Brazilian Herpetological Society (SBH).
#'
#' @format ## `Segalla_2021`
#' A data frame with 1,188 rows and 8 columns:
#' \describe{
#'  \item{species_id}{Id of species in list}
#'   \item{order}{Taxonomic Order}
#'   \item{family}{Taxonomic Family}
#'   \item{subfamily}{Taxonomic Family}
#'   \item{genus}{Genus}
#'   \item{epithet}{Specifc epithet}
#'   \item{species}{Scientific name}
#'   \item{author}{Authorship of original description}
#'
#'   ...
#' }
#'
#'
#'
#'
#' @source <https://zenodo.org/record/4716176>
"Segalla_2021"

#' SALVE ICMBio-MMA Public
#'
#' The Biodiversity Extinction Risk Assessment System - SALVE
#' was developed to facilitate the management of the extinction risk
#' assessment process, coordinated and carried out by ICMBio.
#'
#' Data available as in January, 2025.
#'
#' @format ## `salve_icmbio_2022`
#' A data frame with 1056 rows and 35 columns:
#' \describe{
#'  \item{Reino}{Taxonomic kingdom of the species.}
#'  \item{Filo}{Taxonomic phylum of the species.}
#'  \item{Classe}{Taxonomic class of the species.}
#'  \item{Ordem}{Taxonomic order of the species.}
#'  \item{Familia}{Taxonomic family of the species.}
#'  \item{Genero}{Taxonomic genus of the species.}
#'  \item{Especie}{Taxonomic species of the organism.}
#'  \item{Subespecie}{Taxonomic subspecies of the organism.}
#'  \item{Nome_Cientifico_Anterior}{Previous scientific name of the species.}
#'  \item{Autor}{Author of the scientific description of the species.}
#'  \item{Nome_Comum}{Common name of the species.}
#'  \item{Grupo}{Biological or taxonomic group of the species.}
#'  \item{Mes_Ano_Avaliacao}{Month and year of the extinction risk assessment.}
#'  \item{Categoria}{Extinction risk category of the species.}
#'  \item{Possivemente_Extinta}{Indicates if the species is possibly extinct.}
#'  \item{Criterio}{Criteria used for the extinction risk assessment.}
#'  \item{Justificativa}{Justification for the extinction risk category.}
#'  \item{Endemica_Brasil}{Indicates if the species is endemic to Brazil.}
#'  \item{Consta_em_Lista_Nacional_Oficial}{Indicates if the species is listed in an official national list.}
#'  \item{Estado}{Brazilian states where the species occurs.}
#'  \item{Regiao}{Brazilian regions where the species occurs.}
#'  \item{Bioma}{Brazilian biomes associated with the species' occurrence.}
#'  \item{Bacia_Hidrografica}{Hydrographic basins associated with the species.}
#'  \item{Unidade_de_Conservacao_Federal}{Federal conservation units where the species is found.}
#'  \item{Unidade_de_Conservacao_Estadual}{State conservation units where the species is found.}
#'  \item{RPPN}{Private Natural Heritage Reserves associated with the species.}
#'  \item{Migratoria}{Indicates if the species is migratory.}
#'  \item{Tendencia_Populacional}{Population trend of the species.}
#'  \item{Ameaca}{Known threats to the species.}
#'  \item{Uso}{Known uses of the species.}
#'  \item{Acao_Conservacao}{Conservation actions carried out for the species.}
#'  \item{Plano_de_Acao}{Action plans related to the species.}
#'  \item{Listas_e_Convencoes}{Lists and international conventions related to the species.}
#'  \item{Altitude_min_max_}{Altitude range where the species is found.}
#'  \item{Barimetria_min_max_}{Bathymetry range where the species is found.}
#'
#'  ...
#' }
#'
#' @source <https://salve.icmbio.gov.br/>
"salve_icmbio"
