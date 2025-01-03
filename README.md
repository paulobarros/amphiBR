# **amphiBR** <img src="man/figures/amphibr.png" align="right" width="30%" min-width="120px"/>

<!-- badges: start -->

[![License: GPL v3](https://img.shields.io/badge/License-GPLv3-blue.svg)](https://github.com/paulobarros/amphiBR/blob/master/LICENSE.md)
[![Twitter
Follow](https://img.shields.io/twitter/follow/pbarrosjr?color=%2315202B&label=Seguir%20%40pbarrosjr&style=social)](https://twitter.com/pbarrosjr)
[![pix](https://img.shields.io/badge/Apoie%20com-PIX-brightgreen)](https://nubank.com.br/pagar/v67wv/tuh5iRS2YJ)
<!-- badges: end -->

Pacote R com datasets relacionados aos Anfíbios do Brasil. O objetivo do `amphiBR` é ser um repositório de informações disponíveis sobre a
anurofauna brasileira em uma forma organizada, fácil e acessível. Nosso intuito é organizar o máximo de listas de espécie/ocorrências possível,
sejam de fontes oficiais (MMA,ICMBio, etc) ou de trabalhos publicados na literatura.

O dataset `Segalla_2021` foi extraído da publicação por Segalla et al (2021) na Revista Brasileira de Herpetologia, e disponível também no link <https://zenodo.org/record/4716176>

O pacote atualmente conta também com informações sobre o status de conservação, nome comum, ocorrências por estado da federação, endemismo e ocorrências por biomas. Todas obtidas através da última avaliação do MMA (2022) sobre os anfíbios do Brasil. Também incluímos no pacote informações do Brazilian Tadpole Database (Provete et al., 2012), com informações sobre as espécies que atualmente possuem a descrição dos girinos.

O objetivo deste pacote é facilitar a geração de listas de espécie para projetos, inventários de fauna, ou qualquer outro tipo de documento.

Dúvidas, críticas e sugestões são sempre bem-vindas!

***

## Instalação

O pacote pode ser instalado diretamente do github:

``` r
#install.packages("devtools")

devtools::install_github('paulobarros/amphiBR')

library(amphiBR)

```


## Dataset

O dataset consiste de **1188** linhas com 8 colunas:


`species_id` - Número da espécie na lista

`order` - Ordem

`family` - Família

`subfamily` - Subfamília

`genus` - Gênero

`epithet` - Epíteto específico

`species` - Nome científico

`author` - Autoria

O dataset é automaticamente carregado junto com o pacote e pode ser acessado diretamente
pelo objeto `Segalla_2021`.

```r
> Segalla_2021 |>
+   glimpse()
Rows: 1,188
Columns: 8
$ species_id <dbl> 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 1…
$ order      <chr> "Anura", "Anura", "Anura", "Anura", "Anura", "Anura"…
$ family     <chr> "Allophrynidae", "Allophrynidae", "Allophrynidae", "…
$ subfamily  <chr> NA, NA, NA, NA, "Allobatinae", "Allobatinae", "Allob…
$ genus      <chr> "Allophryne", "Allophryne", "Allophryne", "Limnomedu…
$ epithet    <chr> "relicta", "resplendens", "ruthveni", "macroglossa",…
$ species    <chr> "Allophryne relicta", "Allophryne resplendens", "All…
$ author     <chr> "Caramaschi, Orrico, Faivovich, Dias, & Solé, 2013",…
>

```

