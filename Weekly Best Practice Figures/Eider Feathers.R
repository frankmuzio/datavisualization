#setwd
setwd("C:/Users/frank/OneDrive/Desktop/R CSVs")

#Read CSV
read.csv("eider.down.csv")
eider<-read.csv("eider.down.csv", fileEncoding="UTF-8-BOM")

#Create data.frame
eider.df<-data.frame(eider)

#remove excess rows (not sure why they read this way)
eider.df1<- eider.df[-c(21:43),]
eider.df1

#load ggplot
library(ggplot2)
library(colorspace)

#Set ggplot Population vs total number of nodes
(g <- ggplot(eider.df1, aes(x = Population, y = total.number)))

#set theme
theme_set(theme_bw())

#basic boxplot 
g + geom_boxplot()

#add color and labels 
g + geom_boxplot(aes(color = Population, fill = after_scale(desaturate(lighten(color, .4), .4))),      size = 1) +
  scale_color_brewer(palette = "Dark2", guide = "none") +
  labs(x = "Population", y = "Total Number of Nodes")
  


#Creating a geom_point plot with trendline for barbule lenght vs number of nodes
  #creating ggplot 
(h <- ggplot(eider.df1, aes(x = barbule.length..um., y = total.number)))

#graphing as geom_point
h+geom_point()

#adding red trend line 
h+geom_point()+ 
  geom_smooth(method="lm", se=TRUE, color="red", formula=y~x)+
  labs(x="Length of Barbule (nm)", y = "Total Number of Nodes")

#Practice 