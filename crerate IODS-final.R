#Elsa Isabel de Oliveira Marques
#IODS-Final project 
#10/12/2017
#elsa.marques@helsinki.fi

#Load data set Da
library(FactoMineR)
data("hobbies")

#Explore the data by exploring summary, dimension and head of the data 
library(dplyr)
summary(hobbies)
dim(hobbies)
head(hobbies)

#Graphical visualization of the data
library(GGally)
library(ggplot2)


#Select a subset of data to further analysis 

#Verify how the main dimensions of the data correlate with each other 


## Not run:
res.mca <- MCA(hobbies,quali.sup=19:22,quanti.sup=23,method="Burt")
plot(res.mca,invisible=c("ind","quali.sup"),hab="quali") ### active var. only
plot(res.mca,invisible=c("var","quali.sup"),cex=.5,label="none") ### individuals only
plot(res.mca,invisible=c("ind","var"),hab="quali") ### supp. qualitative var. only
dimdesc(res.mca)
plotellipses(res.mca,keepvar=1:4)


#Explore how the data pairs with each other 

#Calculated correlation matrix and visualize it

