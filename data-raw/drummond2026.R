## Builds `drummond2026` and data-raw/mudancas_2021_2026.csv
##
## Inputs, written by the two Python scripts in data-raw/ (see their headers):
##   data-raw/drummond2026.csv                    species list (Drummond et al. 2026)
##     <- python data-raw/drummond2026_extract.py
##   data-raw/portaria_mma_1704_2026_amphibia.csv threatened/extinct amphibians
##     <- python data-raw/portaria_mma_1704_2026_extract.py  (Portaria MMA 1.704/2026)
##
## Run from the package root:  source("data-raw/drummond2026.R")
## The checks below (stopifnot) reproduce the numbers given in the article.

load("data/segalla2021.rda")

lista <- read.csv("data-raw/drummond2026.csv", encoding = "UTF-8",
                  na.strings = "", stringsAsFactors = FALSE)
portaria <- read.csv("data-raw/portaria_mma_1704_2026_amphibia.csv",
                     encoding = "UTF-8", na.strings = "",
                     stringsAsFactors = FALSE)

lista$new_2026 <- as.logical(lista$new_2026)
stopifnot(nrow(lista) == 1251, !anyDuplicated(lista$species), !is.na(lista$new_2026))
stopifnot(table(lista$order)[c("Anura", "Caudata", "Gymnophiona")] ==
            c(1206, 5, 40))

# Section B of Drummond et al. (2026): species removed from Segalla et al. (2021)
# Junior synonyms (species_2026 = senior synonym)
sinonimos <- c(
  "Brachycephalus atelopoide"  = "Brachycephalus ephippium",
  "Melanophryniscus dorsalis"  = "Melanophryniscus formosus",
  "Rhinella jimi"              = "Rhinella diptycha",
  "Rhinella scitula"           = "Rhinella stanlaii",
  "Vitreorana uranoscopa"      = "Vitreorana parvula",
  "Pristimantis pluvian"       = "Pristimantis fenestratus",
  "Bokermannohyla napolii"     = "Bokermannohyla ravida",
  "Dendropsophus jimi"         = "Dendropsophus cerradensis",
  "Dendropsophus rhea"         = "Dendropsophus cerradensis",
  "Dendropsophus koechlini"    = "Dendropsophus pauiniensis",
  "Leptodactylus sertanejo"    = "Leptodactylus jolyi",
  "Chiasmocleis jimi"          = "Chiasmocleis hudsoni",
  "Elachistocleis bumbameuboi" = "Elachistocleis magna",
  "Elachistocleis carvalhoi"   = "Elachistocleis magna",
  "Elachistocleis matogrosso"  = "Elachistocleis bicolor",
  "Elachistocleis surumu"      = "Elachistocleis surinamensis"
)
# Not confirmed in Brazil; Brazilian records reassigned when stated in the article
removidas <- c(
  "Rhaebo ecuadorensis"            = NA,
  "Lepidobatrachus asper"          = "Lepidobatrachus laevis",
  "Pristimantis conspicillatus"    = NA,
  "Pristimantis eurydactylus"      = NA,
  "Pristimantis marmoratus"        = "Pristimantis grandoculis; Pristimantis crepitaculus",
  "Pristimantis variabilis"        = NA,
  "Pristimantis academicus"        = NA,
  "Pristimantis altamazonicus"     = NA,
  "Pristimantis delius"            = NA,
  "Pristimantis diadematus"        = NA,
  "Pristimantis martiae"           = NA,
  "Pristimantis ventrimarmoratus"  = NA,
  "Ranitomeya sirensis"            = "Ranitomeya hwata",
  "Adelophryne gutturosa"          = "Adelophryne amapaensis",
  "Boana alfaroi"                  = "Boana steinbachi",
  "Boana benitezi"                 = "Boana tepuiana",
  "Boana fasciata"                 = "Boana courtoisae; Boana eucharis; Boana steinbachi",
  "Dendropsophus bifurcus"         = "Dendropsophus salli",
  "Dryaderces pearsoni"            = NA,
  "Scinax baumgardneri"            = NA,
  "Leptodactylus rugosus"          = NA,
  "Chiasmocleis haddadi"           = "Chiasmocleis jacki",
  "Otophryne pyburni"              = NA,
  "Synapturanus salseri"           = "Synapturanus ajuricaba",
  "Odontophrynus americanus"       = "Odontophrynus asper; Odontophrynus toledoi"
)

# Section C: species added through taxonomic changes or range extensions
outras_adicoes <- c(
  "Dryadobates alagoanus", "Dryadobates capixaba", "Dryadobates carioca",
  "Amazophrynella siona", "Melanophryniscus formosus", "Rhinella martyi",
  "Rhinella roqueana", "Rhinella stanlaii", "Lepidobatrachus laevis",
  "Pristimantis espedeus", "Pristimantis grandoculis", "Pristimantis koehleri",
  "Pristimantis lirellus", "Ranitomeya cyanovittata", "Boana steinbachi",
  "Bokermannohyla feioi", "Dendropsophus arndti", "Dendropsophus frosti",
  "Dendropsophus goughi", "Dendropsophus reichlei", "Dendropsophus shiwiarum",
  "Osteocephalus heyeri", "Osteocephalus yasuni", "Scinax chiquitanus",
  "Scinax coerulea", "Scinax jolyi", "Scinax kennedyi",
  "Leptodactylus gualambensis", "Odontophrynus asper"
)

# Section A: genus-level changes (2021 genus -> 2026 genus)
generos <- rbind(
  c("Allobates",    "Dryadobates"),
  c("Rhaebo",       "Adhaerobufo"),
  c("Noblella",     "Phyllonastes"),
  c("Lysapsus",     "Pseudis"),
  c("Scinax",       "Ololygon"),
  c("Scinax",       "Julianus"),
  c("Relictocleis", "Chiasmocleis")
)

stopifnot(length(sinonimos) + length(removidas) == 41,
          length(outras_adicoes) == 29,
          names(c(sinonimos, removidas)) %in% segalla2021$species,
          !names(c(sinonimos, removidas)) %in% lista$species,
          sinonimos %in% lista$species,
          unlist(strsplit(na.omit(removidas), "; ")) %in% lista$species,
          outras_adicoes %in% lista$species,
          !outras_adicoes %in% segalla2021$species)

# New combinations: same species under a new genus (and the epithet adjusted
# to the gender of the genus when needed). Epithets are matched exactly
# first, then by their first four letters.
so_2021 <- setdiff(segalla2021$species, c(lista$species, names(sinonimos),
                                          names(removidas)))
so_2026 <- setdiff(lista$species, c(segalla2021$species, outras_adicoes))
ep <- function(x) sub("^\\S+ ", "", x)
gen <- function(x) sub(" .*$", "", x)
renomeadas <- data.frame(species_2021 = character(), species_2026 = character())
for (i in seq_len(nrow(generos))) {
  velhos <- so_2021[gen(so_2021) == generos[i, 1]]
  novos <- so_2026[gen(so_2026) == generos[i, 2]]
  for (n in novos) {
    m <- velhos[ep(velhos) == ep(n)]
    if (length(m) == 0) m <- velhos[substr(ep(velhos), 1, 4) == substr(ep(n), 1, 4)]
    if (length(m) == 1) {
      renomeadas[nrow(renomeadas) + 1, ] <- c(m, n)
      velhos <- setdiff(velhos, m)
    }
  }
}
stopifnot(!anyDuplicated(renomeadas$species_2021),
          setequal(renomeadas$species_2021, so_2021))
novas <- setdiff(so_2026, renomeadas$species_2026)

# Article: 41 removed, 104 added (75 described since 2021 + 29 other)
stopifnot(length(novas) == 75, length(novas) + length(outras_adicoes) == 104)
# The additions are the entries printed in red in the PDF, except two that
# were left in black: Chiasmocleis jacki and Dendropsophus shiwiarum.
stopifnot(setequal(c(lista$species[lista$new_2026],
                     "Chiasmocleis jacki", "Dendropsophus shiwiarum"),
                   c(novas, outras_adicoes)))

## Changelog 2021 -> 2026 ---------------------------------------------------
familia <- function(x) {
  f <- lista$family[match(x, lista$species)]
  ifelse(is.na(f), segalla2021$family[match(x, segalla2021$species)], f)
}
mudancas <- rbind(
  data.frame(species_2026 = novas, species_2021 = NA,
             change = "new species", note = NA),
  data.frame(species_2026 = outras_adicoes, species_2021 = NA,
             change = "added", note = NA),
  data.frame(species_2026 = renomeadas$species_2026,
             species_2021 = renomeadas$species_2021,
             change = "new combination", note = NA),
  data.frame(species_2026 = unname(sinonimos), species_2021 = names(sinonimos),
             change = "synonymized",
             note = paste("junior synonym of", unname(sinonimos))),
  data.frame(species_2026 = NA, species_2021 = names(removidas),
             change = "removed",
             note = ifelse(is.na(removidas), "no confirmed record in Brazil",
                           paste("Brazilian records refer to", removidas)))
)
mudancas$family <- familia(ifelse(is.na(mudancas$species_2026),
                                  mudancas$species_2021, mudancas$species_2026))
mudancas <- mudancas[order(mudancas$change, mudancas$family,
                           mudancas$species_2026, mudancas$species_2021),
                     c("family", "species_2021", "species_2026", "change", "note")]
write.csv(mudancas, "data-raw/mudancas_2021_2026.csv", row.names = FALSE,
          na = "", fileEncoding = "UTF-8")

## Dataset --------------------------------------------------------------------
lista$status <- NA_character_
lista$status[lista$species %in% novas] <- "recently described species"
lista$status[lista$species %in% outras_adicoes] <- "taxonomic change or new record"
lista$status[lista$species %in% renomeadas$species_2026] <- "new combination"

# Category as published in Portaria MMA 1.704/2026, matched by the exact name.
# Names not in the 2026 list (e.g. Bokermannohyla napolii, now a junior
# synonym) are not transferred to another species.
lista$category <- portaria$category[match(lista$species, portaria$species)]
message("Portaria names not in the list: ",
        paste(setdiff(portaria$species, lista$species), collapse = ", "))

lista$species_id <- seq_len(nrow(lista))
drummond2026 <- tibble::as_tibble(lista[, c(
  "species_id", "order", "family", "subfamily", "tribe", "genus", "epithet",
  "species", "author", "status", "category"
)])

save(drummond2026, file = "data/drummond2026.rda", compress = "bzip2")
