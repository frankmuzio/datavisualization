#ggmap tutorial
#setwd
setwd("C:/Users/frank/OneDrive/Desktop/R CSVs")

#packages
install.packages("ggmap")

install.packages("lubridate")
install.packages("ggplot2")
install.packages("data.table")
install.packages("ggrepel")
install.packages("dplyr")
install.packages("data.table")
install.packages("tidyverse")

library(lubridate)
library(ggplot2)
library(dplyr)
library(data.table)
library(ggrepel)
library(tidyverse)
library(ggmap)
library(ggsn)

#ggmap API
ggmap::register_google(key = "AIzaSyDrZeidnROxWzEmn4rBn87fCXWqWLAt3QI")

#Practice
corvallis <- c(lon = -123.2620, lat = 44.5646) #create corvallis coordinates
map_5<-get_map(corvallis, zoom = 5, scale = 1) # set up get_map with 5 zoom
ggmap(map_5) #print
corvallis_map<-get_map(corvallis, zoom = 13, scale = 1) #change zoom to 13
ggmap(corvallis_map)#print

#load sales data
sales = readRDS("01_corv_sales.rds")

#print sales onto corvallis map
ggmap(corvallis_map) +
  geom_point(aes(lon, lat), data = sales)

#add color based on year built
ggmap(corvallis_map) +
  geom_point(aes(lon, lat, color=year_built, size = bedrooms), data = sales)


# map based on squarefootage
ggmap(corvallis_map) +
  geom_point(aes(lon, lat, color=price / finished_squarefeet), data = sales)


#display on satellite map
corvallis_map_sat <- get_map(corvallis, zoom = 13, maptype="satellite")
ggmap(corvallis_map_sat) +
    geom_point(aes(lon, lat, color = year_built), data = sales)

#display on terrain
corvallis_map_ton <- get_map(corvallis, zoom = 13, maptype="toner")
ggmap(corvallis_map_ton) +
  geom_point(aes(lon, lat, color = year_built), data = sales)

#add base_layer and facet_wrap
ggmap(corvallis_map_ton, base_layer = ggplot(sales, aes(lon, lat))) +
  geom_point(aes(color = class)) +
  facet_wrap(~ class)


#plot housing using qmplot() based on bedrooms and month
qmplot(lon, lat, data = sales, 
       geom = "point", color = bedrooms) +
  facet_wrap(~ month)



#Trying with new Ridgeway's Rail data
setwd("C:/Users/frank/OneDrive/Desktop/R CSVs")
rr<-read.csv("Ridgeway'sRail.csv", fileEncoding="UTF-8-BOM")

mexico <- c(lon = -110.1400, lat = 26.57390) #create mexico coordinates
mex.map<-get_map(mexico, zoom = 6, maptype = "terrain")
ggmap(mex.map)+
  geom_point(aes(Log, Lat, color=Species), data = rr, shape=22, fill="red", color="black", size=1.5)+
  xlab(expression(paste("Longitude"))) +
  ylab(expression(paste("Latitude ")))+
  ggtitle("Occurrences of Ridgeway's Rail in Mexico (2019-2020)")
 


#Doing the same thing without GGMap
library("rnaturalearth")
library("rnaturalearthdata")

world <- ne_countries(scale = "medium", returnclass = "sf")
class(world)

(sites <- data.frame(longitude = c(-80.144005, -80.109), latitude = c(26.479005, 
                                                                      26.83)))
ggplot(data = world) +
  geom_sf() +
  coord_sf(xlim = c(-118, -102), ylim = c(17, 35), expand = TRUE)+
  geom_point(aes(Log, Lat, color=Species), data = rr, shape=15)+
  xlab(expression(paste("Longitude"))) +
  ylab(expression(paste("Latitude ")))+
  ggtitle("Occurrences of Ridgeway's Rail (2019-2020)")+
  scale_color_manual(values=c("red3"))+
  theme(strip.text.x = element_blank(),
        strip.background = element_rect(colour="white", fill="white"),
        legend.position=c(.25,.25))

  


 
  