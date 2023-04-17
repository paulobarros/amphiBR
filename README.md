# **amphiBR** <img src="man/figures/amphibr.png" align="right" width="30%" min-width="120px"/>

<!-- badges: start -->

[![License: GPL v3](https://img.shields.io/badge/License-GPLv3-blue.svg)](https://github.com/paulobarros/amphiBR/blob/master/LICENSE.md)
[![Twitter
Follow](https://img.shields.io/twitter/follow/pbarrosjr?color=%2315202B&label=Seguir%20%40pbarrosjr&style=social)](https://twitter.com/pbarrosjr)
[![pix](https://img.shields.io/badge/Apoie%20com-PIX-brightgreen)](https://nubank.com.br/pagar/v67wv/tuh5iRS2YJ)
<!-- badges: end -->

Pacote R com dataset da publicação oficial da Lista de Anfíbios do Brasil publicada pela Sociedade Brasileira de Herpetologia.

O dataset foi extraído da publicação por Segalla et al (2021) na Revista Brasileira de Herpetologia, e disponível também no link <https://zenodo.org/record/4716176>

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

O dataset consiste de **1188** linhas com 49 colunas:


`species_id` - Número da espécie na lista

`order` - Ordem

`family` - Família

`subfamily` - Subfamília

`genus` - Gênero

`epithet` - Epíteto específico

`species` - Nome científico

`author` - Autoria

`status` - Observações gerais do autor da Lista

`common_name_br` - Nome popular no Brasil

`category` - Cateogoria de Ameaça pela Portaria MMA 300/2022

`endemic_br` - Se a espécie é ou não endêmica do país

`AC-TO` - Ocorrência a nível estadual da espécie no país (1=ocorre, 0=não ocorre)

`AF-UNK` - Ocorrência a nível de Biomas

  * AF = Mata ATlântica
  
  * PAN = Pantanal
  
  * PAM = Pampa
  
  * AMZ = Amazônia
  
  * CER = Cerrado
  
  * CAA = Caatinga
  
  * UNK = Desconhecido
  
`tad_ext_morhp` - Descrição da morfologia externa do girino/larva

`tad_int_oral_feat` - Descrição das características internas da cavidade oral do girino/larva

`tad_chond` - Descrição do chondocrânio do girino/larva



O dataset é automaticamente carregado junto com o pacote e pode ser acessado diretamente:

```r
> segalla2021
# A tibble: 1,188 × 49
   species_id order family    subfamily genus epithet species author status common_name_br
        <dbl> <chr> <chr>     <chr>     <chr> <chr>   <chr>   <chr>  <chr>  <chr>         
 1          1 Anura Allophry… NA        Allo… relicta Alloph… Caram… NA     NA            
 2          2 Anura Allophry… NA        Allo… resple… Alloph… Castr… NA     Resplendent F…
 3          3 Anura Allophry… NA        Allo… ruthve… Alloph… Gaige… NA     NA            
 4          4 Anura Alsodidae NA        Limn… macrog… Limnom… (Dumé… NA     Rãzinha-de-co…
 5          5 Anura Aromobat… Allobati… Allo… bacurau Alloba… Simõe… NA     NA            
 6          6 Anura Aromobat… Allobati… Allo… brunne… Alloba… (Cope… NA     Chapada Rocke…
 7          7 Anura Aromobat… Allobati… Allo… caerul… Alloba… (Lima… NA     NA            
 8          8 Anura Aromobat… Allobati… Allo… caldwe… Alloba… Lima,… recen… NA            
 9          9 Anura Aromobat… Allobati… Allo… carajas Alloba… Simõe… NA     NA            
10         10 Anura Aromobat… Allobati… Allo… conspi… Alloba… (Mora… NA     NA            
# ℹ 1,178 more rows
# ℹ 39 more variables: category <chr>, endemic_br <chr>, AC <dbl>, AL <dbl>, AP <dbl>,
#   AM <dbl>, BA <dbl>, CE <dbl>, DF <dbl>, ES <dbl>, GO <dbl>, MA <dbl>, MT <dbl>,
#   MS <dbl>, MG <dbl>, PA <dbl>, PB <dbl>, PR <dbl>, PE <dbl>, PI <dbl>, RJ <dbl>,
#   RN <dbl>, RS <dbl>, RO <dbl>, RR <dbl>, SC <dbl>, SP <dbl>, SE <dbl>, TO <dbl>,
#   AF <dbl>, PAN <dbl>, PAM <dbl>, AMZ <dbl>, CER <dbl>, CAA <dbl>, UNK <dbl>,
#   tad_ext_morph <chr>, tad_int_oral_feat <chr>, tad_chond <chr>
# ℹ Use `print(n = ...)` to see more rows

```

