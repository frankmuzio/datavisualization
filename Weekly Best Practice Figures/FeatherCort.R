# Practice Figures #2
# Frank Muzio
# February 15, 2021
# Ambient temperature, body condition and sibling rivalry explain feather corticosterone levels in developing black kites


#Install packages
library(ggplot2)
library(colorspace)
library(dplyr)
library(ggforce)



#setwd
setwd("C:/Users/frank/OneDrive/Desktop/R CSVs")

#Read CSV
read.csv("feathercort.csv")
feathercort<-read.csv("feathercort.csv")

#Create data.frame
feathercort.df<-data.frame(feathercort)

#Set up mean temperature vs. feather cort
(g <- ggplot(feathercort.df, aes(x = MEAN.TEMPERATURE, y = FEATHER.CORT)))

g + geom_point()


#Setting Temp Ranges
t1 <- dplyr::filter(feathercort.df, MEAN.TEMPERATURE > 16.0 & MEAN.TEMPERATURE < 18.5)
t2 <- dplyr::filter(feathercort.df, MEAN.TEMPERATURE > 18.5 & MEAN.TEMPERATURE < 21.0)
t3 <- dplyr::filter(feathercort.df, MEAN.TEMPERATURE > 21.0 & MEAN.TEMPERATURE < 23.5)
t4 <- dplyr::filter(feathercort.df, MEAN.TEMPERATURE > 23.5 & MEAN.TEMPERATURE < 27.0)


plot(mean(t1$FEATHER.CORT))


ggplot(feathercort.df, aes(x=MEAN.TEMPERATURE, y=FEATHER.CORT))+
  geom_point()

 ggplot(t1, aes(x=MEAN.TEMPERATURE, y=FEATHER.CORT))+
 geom_point(mean(t1$FEATHER.CORT))
 
#setting up ggplot for brood order vs feather cort
 theme_set(theme_bw())

 h<- ggplot(feathercort.df, aes(x=BROOD.ORDER, y = FEATHER.CORT, color = BROOD.ORDER))+
   labs(x = "Brood Order", y = "Feather CORT (pg/mm)") +
   scale_color_brewer(palette = "Dark2", guide = "none")
 
# Plotting geom_violin
 h+geom_violin(fill = "gray80", size = 1, alpha=0.5)

#Adding jitter plot over and coord flip 
 h+geom_violin(fill = "gray80", size = 1, alpha=0.5)+
   geom_jitter(alpha = .50, width = .075)+
   coord_flip()
 
 
 

 
#Plot age vs cort level
 (age <- ggplot(feathercort.df, aes(x = AGE, y = FEATHER.CORT)))
age + geom_jitter()

#add trendline
(age <- ggplot(feathercort.df, aes(x = AGE, y = FEATHER.CORT)))
age + geom_point()+geom_smooth(method = "lm")
