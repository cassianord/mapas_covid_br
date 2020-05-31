## COVID-19 cartograms for Brasil and Santa Catarina
library(rmapshaper)
library(rgdal)
library(readr)
library(sf)
library(dplyr)
library(topogram)

#### SANTA CATARINA ####

## Grab data for SC
data_mun_sc <- read_csv("https://data.brasil.io/dataset/covid19/caso.csv.gz") %>%
  filter(place_type %in% c("city")) %>%
  filter(!city %in% c("Importados/Indefinidos")) %>%
  filter(confirmed > 0) %>%
  filter(state %in% c("SC")) %>%
  rename(CD_GEOCMU = city_ibge_code) %>%
  filter(is_last %in% c("TRUE"))


## Shape for SC
shp_mun_sc <- read_municipality(code_muni=42, year=2018) %>%
                            rename(CD_GEOCMU = code_muni)

## Convert CRS to longlat
shp_mun_sc <- st_transform(shp_mun_sc, "+init=epsg:4326 +proj=longlat +datum=WGS84")

## Join last data to the shape
mun_sc_shp_dados <- shp_mun_sc %>%
  left_join(., data_mun_sc %>% filter(is_last %in% c("TRUE")), by = "CD_GEOCMU", keep = F)

## Change NA to 1 (otherwise, polygons with NA dont show. If replaced with 0, the algorithm dont work properly)
mun_sc_shp_dados$confirmed[is.na(mun_sc_shp_dados$confirmed)] <- 1

## Cartogram for SC
topo_sc <- topogram(
  shape = mun_sc_shp_dados, 
  value = "confirmed",
  tooltip_label = ~name_muni, 
  n_iteration = 10
) %>% 
  add_legend(
    title = "nº casos",
    n_cells = 8,
    orientation = "vertical"
  ) %>% 
  add_labs(
    title = "Casos de COVID-19 em Santa Catarina",
    subtitle = "Dados até 28/05",
    caption = "Fonte dos dados: Brasil.io"
  )

topo_sc


#### BRASIL ####

## Grab data for BR
data_mun <- read_csv("https://data.brasil.io/dataset/covid19/caso.csv.gz") %>% # base prioritária
  filter(place_type %in% c("city")) %>%
  filter(confirmed > 0) %>%
  rename(CD_GEOCMU = city_ibge_code)

## Shape for SC
shp_mun_br <-  read_municipality(code_muni="all", year=2018) %>%
                                  rename(CD_GEOCMU = code_muni)

## Convert CRS to longlat
shp_mun_br <- st_transform(shp_mun_br, "+init=epsg:4326 +proj=longlat +datum=WGS84")

## Join last data to the shape
mun_br_dados <- shp_mun_br %>%
  left_join(., data_mun %>% filter(is_last %in% c("TRUE")), by = "CD_GEOCMU", keep = F)

## Change NA to 1 (otherwise, polygons with NA dont show. If replaced with 0, the algorithm dont work properly)
mun_br_dados$confirmed[is.na(mun_br_dados$confirmed)] <- 1


## Cartogram for BR 
topo_br <- topogram(
  shape = mun_br_dados, 
  value = "confirmed",
  tooltip_label = ~name_muni, 
  n_iteration = 15
) %>% 
  add_legend(
    title = "nº casos",
    n_cells = 8,
    orientation = "vertical"
  ) %>% 
  add_labs(
    title = "Casos de COVID-19 no Brasil",
    subtitle = "Dados até 28/05",
    caption = "Fonte dos dados: Brasil.io"
  )

topo_br # (it may take a while to load)