# amphiBR

``` r

library(amphiBR)
```

Neste pequeno exemplo vamos abordar como gerar uma lista de espécies
obedecendo a taxonomia proposta pela Lista de Anfíbios do Brasil da SBH
(SEGALLA et al., 2021).

Para realizar essa tarefa precisaremos de alguns pacotes auxiliares além
do `amphiBR`. O código para instalação dos pacotes está comentado, caso
você ainda não possua o pacote instalado basta descomentar e executar as
linhas correspondentes.

``` r

# install.packages("tidyverse")
# install.pakcages("kableExtra")

library(dplyr)
#> 
#> Attaching package: 'dplyr'
#> The following objects are masked from 'package:stats':
#> 
#>     filter, lag
#> The following objects are masked from 'package:base':
#> 
#>     intersect, setdiff, setequal, union
library(kableExtra)
#> 
#> Attaching package: 'kableExtra'
#> The following object is masked from 'package:dplyr':
#> 
#>     group_rows
```

Precisamos primeiro obter uma lista aleatória de espécies para usar no
nosso exemplo, importante frisar que ao utilizar a sua lista de espécies
para filtrar o banco de dados, a nomenclatura deve seguir a adotada por
(SEGALLA et al., 2021) no qual se baseia este pacote. No nosso caso
utilizaremos os dados da própria lista para sortear 20 espécies
aleatoriamente.

Existem diversas formas de entrar com uma lista de espécies em
particular. Ela pode ser criada diretamente no script como um
`data.frame` contendo duas colunas, uma para **gênero** e outra para o
**epíteto específico**, ou pode ser lida a partir de uma planila do
excel ou arquivo .csv/.txt.

``` r

minhas_especies <- segalla2021 %>%
  filter(species_id %in% sample(1:1188, size = 20, replace = FALSE)) %>%
  select(order, family, subfamily,species_id, genus, epithet)

minhas_especies
#> # A tibble: 20 × 6
#>    order family           subfamily       species_id genus           epithet    
#>    <chr> <chr>            <chr>                <dbl> <chr>           <chr>      
#>  1 Anura Brachycephalidae NA                      63 Brachycephalus  mariaetere…
#>  2 Anura Brachycephalidae NA                      70 Brachycephalus  pulex      
#>  3 Anura Brachycephalidae NA                      77 Ischnocnema     abdita     
#>  4 Anura Bufonidae        NA                     197 Rhinella        merianae   
#>  5 Anura Hylidae          Cophomantinae          446 Boana           leucocheila
#>  6 Anura Hylidae          Cophomantinae          447 Boana           lundii     
#>  7 Anura Hylidae          Cophomantinae          460 Boana           pulchella  
#>  8 Anura Hylidae          Cophomantinae          485 Bokermannohyla  itapoty    
#>  9 Anura Hylidae          Dendropsophinae        517 Dendropsophus   cruzi      
#> 10 Anura Hylidae          Dendropsophinae        536 Dendropsophus   meridianus 
#> 11 Anura Hylidae          Dendropsophinae        546 Dendropsophus   novaisi    
#> 12 Anura Hylidae          Dendropsophinae        555 Dendropsophus   riveroi    
#> 13 Anura Hylidae          Dendropsophinae        559 Dendropsophus   salli      
#> 14 Anura Hylidae          Dendropsophinae        567 Dendropsophus   tintinnabu…
#> 15 Anura Hylidae          Scinaxinae             674 Scinax          duartei    
#> 16 Anura Hylidae          Scinaxinae             752 Sphaenorhynchus canga      
#> 17 Anura Hylodidae        NA                     773 Crossodactylus  timbuhy    
#> 18 Anura Leptodactylidae  Leptodactylinae        898 Adenomera       inopinata  
#> 19 Anura Leptodactylidae  Leptodactylinae        927 Leptodactylus   fuscus     
#> 20 Anura Odontophrynidae  NA                    1086 Proceratophrys  redacta
```

Com a nossa lista das espécies de interesse em mãos, basta agora filtar
o nosso banco de dados e gerar a tabela, faremos tudo isso num mesmo
trecho de código.

``` r

options(knitr.kable.NA = '')

segalla2021 %>%
  filter(species_id %in% minhas_especies$species_id ) %>%
  select(order, family, subfamily, genus, epithet) %>%
  kable(col.names = c("Ordem","Família", "Subfamília","Gênero","Epíteto Específico")) %>%
  kable_classic_2() %>%
  column_spec(1:3,bold = T) %>%
  column_spec(4:5, italic = T) %>%
  collapse_rows(columns = 1:3, valign = "top") %>%
  row_spec(0, bold = T)
```

| Ordem | Família          | Subfamília      | Gênero          | Epíteto Específico |
|:------|:-----------------|:----------------|:----------------|:-------------------|
| Anura | Brachycephalidae |                 | Brachycephalus  | mariaeterezae      |
|       |                  |                 | Brachycephalus  | pulex              |
|       |                  |                 | Ischnocnema     | abdita             |
|       | Bufonidae        |                 | Rhinella        | merianae           |
|       | Hylidae          | Cophomantinae   | Boana           | leucocheila        |
|       |                  |                 | Boana           | lundii             |
|       |                  |                 | Boana           | pulchella          |
|       |                  |                 | Bokermannohyla  | itapoty            |
|       |                  | Dendropsophinae | Dendropsophus   | cruzi              |
|       |                  |                 | Dendropsophus   | meridianus         |
|       |                  |                 | Dendropsophus   | novaisi            |
|       |                  |                 | Dendropsophus   | riveroi            |
|       |                  |                 | Dendropsophus   | salli              |
|       |                  |                 | Dendropsophus   | tintinnabulum      |
|       |                  | Scinaxinae      | Scinax          | duartei            |
|       |                  |                 | Sphaenorhynchus | canga              |
|       | Hylodidae        |                 | Crossodactylus  | timbuhy            |
|       | Leptodactylidae  | Leptodactylinae | Adenomera       | inopinata          |
|       |                  |                 | Leptodactylus   | fuscus             |
|       | Odontophrynidae  |                 | Proceratophrys  | redacta            |

A mesma receita funciona com a edição de 2026 da lista (DRUMMOND et al.,
2026), no dataset `drummond2026`, que traz também a categoria de ameaça
pela Portaria MMA nº 1.704/2026 na coluna `category`. Basta trocar
`segalla2021` por `drummond2026` no código acima (e sortear em
`1:1251`).

Simples não? Boas listas! Dúvidas, críticas, problemas ou sugestões
<pbarrosbio@gmail.com>

##### Referências

DRUMMOND, L. et al. [List of Amphibians of
Brazil](https://doi.org/10.5281/zenodo.18340087). **Herpetol. Bras**, v.
15, n. 2, 2026.

SEGALLA, M. et al. Lista de Anfı́bios do Brasil. **Herpetol. Bras**, v.
10, p. 122–226, 2021.
