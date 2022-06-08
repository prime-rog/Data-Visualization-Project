# Assignment on ggplot 2

library(ggplot2)
library(data.table)
install.packages("ggthemes")
library(ggthemes)
df <- fread('Economist_Assignment_Data.csv' , drop =1 )


head(df)

str(df)

View(df)


pl <- ggplot(df , aes(x = CPI , y= HDI))

pl+geom_point() 

pl+geom_point(aes(color=factor(Region)))


?geom_point

pl2 <- pl+geom_point(aes(color=factor(Region)) , pch=1 , size = 5)


pl2 <- pl2 + geom_smooth(aes(group=1) , method = 'lm' , formula = y ~ log(x), se =F , color='red')


pl2 + geom_text(aes(label=Country))

pointsToLabel <- c("Russia", "Venezuela", "Iraq", "Myanmar", "Sudan",
                   "Afghanistan", "Congo", "Greece", "Argentina", "Brazil",
                   "India", "Italy", "China", "South Africa", "Spane",
                   "Botswana", "Cape Verde", "Bhutan", "Rwanda", "France",
                   "United States", "Germany", "Britain", "Barbados", "Norway", "Japan",
                   "New Zealand", "Singapore")

pl3 <- pl2 + geom_text(aes(label = Country), color = "gray20", 
                       data = subset(df, Country %in% pointsToLabel),check_overlap = TRUE)

pl3

pl4<-pl3 + ggtitle('Corruption and Human development') + theme_economist_white() 

pl5 <- pl4+  scale_x_continuous(name = 'Corruption Perception Index, 2011 (10 =least corrupt)' , limits = c(0.9,10.5) , breaks = 1:10 )
pl5


pl6 <- pl5 + scale_y_continuous(name = "Human Development Index, 2011 (1=Best)",
                                limits = c(0.2, 1.0))
pl6
 

## AMAN SINGH 
## PRIME-ROG 
 
 