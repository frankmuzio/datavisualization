### Fixing a 3D plot####
## March 24, 2021
# Frank Muzio

#------------------------------
library(ggplot2)
library(ggpubr)
head(mtcars)


p1 <- ggplot(mtcars, aes(x = mpg, y = qsec))
p2 <- ggplot(mtcars, aes(x = mpg, y = hp))
p3 <- ggplot(mtcars, aes(x = qsec, y = hp))
p4 <- ggplot(mtcars, aes(x = disp, y = hp))

a <- p1 + geom_point(color = "steelblue2") + 
  labs(x= "Gas Mileage (mpg)", y= "0-60mph (sec)") + 
  theme(panel.grid.major = element_blank(), 
        panel.grid.minor = element_blank(),
        panel.background = element_blank(), 
        axis.line = element_line(colour = "black"))

b <- p2 + geom_point(color = "steelblue2") + 
  labs(x= "Gas Mileage (mpg)", y= "Horsepower") + 
  theme(panel.grid.major = element_blank(), 
        panel.grid.minor = element_blank(), 
        panel.background = element_blank(), 
        axis.line = element_line(colour = "black"))     

c <- p3 + geom_point(color = "steelblue2") + 
  labs(x= "0-60mph (sec)", y= "Horsepower")+ 
  theme(panel.grid.major = element_blank(), 
        panel.grid.minor = element_blank(), 
        panel.background = element_blank(), 
        axis.line = element_line(colour = "black"))

d <- p4 + geom_point(color = "steelblue2") + 
  labs(x= "Engine Displacement", y= "Horsepower")+ 
  theme(panel.grid.major = element_blank(), 
        panel.grid.minor = element_blank(),
        panel.background = element_blank(), 
        axis.line = element_line(colour = "black"))

full <- ggarrange(a,b,c,d, nrow=2, ncol=2)
print(full)
# annotate_figure(full, top = text_grob("MTCars Data", color = "Black", size = 14))
                print(a)
                