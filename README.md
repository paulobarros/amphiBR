# **amphiBR** <img src="man/figures/amphibr.png" align="right" width="30%" min-width="120px"/>

<!-- badges: start -->

[![License: GPL v3](https://img.shields.io/badge/License-GPLv3-blue.svg)](https://github.com/paulobarros/amphiBR/blob/master/LICENSE.md)
[![Twitter
Follow](https://img.shields.io/twitter/follow/pbarrosjr?color=%2315202B&label=Seguir%20%40pbarrosjr&style=social)](https://twitter.com/pbarrosjr)
<!-- badges: end -->

Pacote R com dataset da publicação oficial da Lista de Anfíbios do Brasil publicada pela Sociedade Brasileira de Herpetologia.

O dataset foi extraído da publicação por Segalla et al (2021) na Revista Brasileira de Herpetologia, e disponível também no link <https://zenodo.org/record/4716176>

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


`order` - Ordem

`family` - Família

`subfamily` - Subfamília

`sp_num` - Número da espécie na lista

`genus` - Gênero

`epithet` - Epíteto específico

`author` - Autoria

`status` - Observações

O dataset é automaticamente carregado junto com o pacote e pode ser acessado diretamente:

```r
> amphibiansBR
# A tibble: 1,188 × 8
   order family        subfamily     sp_num genus       epithet        author status
   <chr> <chr>         <chr>         <chr>  <chr>       <chr>          <chr>  <chr> 
 1 Anura Allophrynidae NA            1      Allophryne  relicta        Caram… NA    
 2 Anura Allophrynidae NA            2      Allophryne  resplendens    Castr… NA    
 3 Anura Allophrynidae NA            3      Allophryne  ruthveni       Gaige… NA    
 4 Anura Alsodidae     NA            4      Limnomedusa macroglossa    (Dumé… NA    
 5 Anura Aromobatidae  (Allobatinae) 5      Allobates   bacurau        Simõe… NA    
 6 Anura Aromobatidae  (Allobatinae) 6      Allobates   brunneus       (Cope… NA    
 7 Anura Aromobatidae  (Allobatinae) 7      Allobates   caeruleodacty… (Lima… NA    
 8 Anura Aromobatidae  (Allobatinae) 8      Allobates   caldwellae     Lima,… recen…
 9 Anura Aromobatidae  (Allobatinae) 9      Allobates   carajas        Simõe… NA    
10 Anura Aromobatidae  (Allobatinae) 10     Allobates   conspicuus     (Mora… NA    
# … with 1,178 more rows
# ℹ Use `print(n = ...)` to see more rows

```

