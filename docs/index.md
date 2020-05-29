## Visualizações da COVID-19 no Brasil

Essa página visa apresentar algumas visualizações dos números da COVID-19 em território brasileiro. 

### Cartogramas

Cartogramas são mapas onde a área de cada unidade geográfica é distorcia de acordo com alguma variável de interesse. São alternativas interessantes para visualizar a distribuição de uma variável no território e evitar possíveis confusões geradas pela área das unidades territoriais.

Abaixo você confere alguns cartogramas da COVID-19. Antes, duas observações:

1. Os mapas nessa página não são interativos, pra deixar o carregamento mais leve. Abaixo de cada cartograma há um link para as versões interativas, onde é possível ver os números nos municípios. Como eles são pesados, podem demorar para carregar. Com um pouquinho de paciência você poderá visualizá-los =)
2. O algoritmo gerador dos cartogramas não funciona adequadamente quando a variável de interesse é nula ou zero em alguma unidade geográfica. Devido a isso, transformei os valores nulos e zeros em 1. Municípios que apresentam apenas 1 caso, portanto, não devem ser interepretados como necessariamente possuindo algum caso de COVID-19.

#### Cartograma da COVID-19 em Santa Catarina

![mapa_Sc](https://cassianord.github.io/mapas_covid_br/images/cartograma_SC_28_05.png)

[Link para a versão interativa do mapa](https://cassianord.github.io/mapas_covid_br/images/topo_sc.html)


#### Cartograma da COVID-19 no Brasil

No caso do Brasil, anexei aqui a imagem estática, porque a interativa é muito pesada. 

![mapa_br](https://cassianord.github.io/mapas_covid_br/images/carto_br_28_05.png)

[Link para a versão interativa do mapa](https://cassianord.github.io/mapas_covid_br/images/carto_br.html)


(em breve, outros mapas!)

-----------------------------------------
- Os cartogramas foram gerados através do pacote `topogram` no R. 
- Os dados da COVID-19 foram obtidos do [Brasil.io](https://brasil.io/home/)

