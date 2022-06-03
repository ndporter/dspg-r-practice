#R Practice day 2 - more pictures!
#NDP
#2022-06-03

#load libraries
library(gapminder)
library(ggplot2)
library(dplyr)

#histogram
ggplot(data=gapminder, aes(x=lifeExp)) +
  geom_histogram()

#filter by year
gapminder %>% filter(year==1992) %>%
  ggplot(aes(x=lifeExp)) +
  geom_histogram()

mean(gapminder$lifeExp)
gapminder[gapminder$lifeExp==min(gapminder$lifeExp),]

gapminder %>%
  filter(year==1952, continent=="Asia") %>%
  ggplot(aes(x=country, y=gdpPercap)) +
  geom_col() +
  coord_flip()
  #theme(axis.text.x = element_text(angle=90))

###Map data
library(raster)
library(rgdal)
DSM_HARV <- raster("data/dc-geospatial/NEON-DS-Airborne-Remote-Sensing/HARV/DSM/HARV_dsmCrop.tif")
summary(DSM_HARV)

DSM_HARV_df <- as.data.frame(DSM_HARV, xy=TRUE)
ggplot() +
  geom_raster(data=DSM_HARV_df, aes(x=x,y=y, fill=HARV_dsmCrop)) +
  #scale_fill_viridis_c() +
  coord_quickmap()
