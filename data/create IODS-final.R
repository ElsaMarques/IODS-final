#Elsa Isabel de Oliveira Marques
#IODS-Final project 
#10/12/2017
#elsa.marques@helsinki.fi

#Define the working directory
setwd("~/Documents/GitHub/IODS-final/data")

#Load data set Da
library(FactoMineR)
data("hobbies")

#Explore the data by exploring summary, dimension and head of the data 
library(dplyr)
summary(hobbies)

dim(hobbies)

head(hobbies)
  
#You can see that some of the variables names are long

#Rename the variables in order to facilitate the analysis of the data
hobbies_ <- hobbies
colnames(hobbies_) <- c("Read", "L.Music", "Cinema", "Show", "Exhib" , "Comp", "Sport", "Walk" , "Travel", "Play.M", "Collect", "Volunteer", "Mech", "Garden", "Knitt", "Cook", "Fish", "TV", "Gender","Age", "Marital.St", "Prof", "N.Act")


#all variables but the nb.activities are presented as factors
#in order to perform the MCA analysis all variables need to be factors 
#nb.activities is transformed to factors 
hobbies_[, "N.Act"] = as.factor(hobbies_[,"N.Act"])
hobbies_
head(hobbies_)

# Make subsets of data according to the type of data

# Define the variable Generic_Hobbies that will include c("Read", "L.Music", "Cinema", "Comp", "TV", "Gender","Age", "Marital.St", "Prof", "N.Act")
Generic_Hobbies <- select(hobbies_, c("Read", "L.Music", "Cinema", "Comp", "TV", "Gender","Age", "Marital.St", "Prof"))

# Define the variable Artistic_Hobbies that will include c("Show", "Exhib", "Play.M", "Collect", "Gender","Age", "Marital.St", "Prof", "N.Act")
Artistic_Hobbies <- select(hobbies_, c("Show", "Exhib", "Play.M", "Collect"))

# Define the variable Sport_Hobbies that will include c("Sport", "Walk" , "Travel", "Fish", "Gender","Age", "Marital.St", "Prof", "N.Act")
Sport_Hobbies <- select(hobbies_, c("Sport", "Walk" , "Travel", "Fish"))

# Define the variable Handcraft_Hobbies that will include c("Mech", "Garden", "Knitt", "Cook")
Handcraft_Hobbies <- select(hobbies_, c("Mech", "Garden", "Knitt", "Cook"))

# Define the variable Charity_Hobbies that will include c("Volunteer")
Charity_Hobbies <- select(hobbies_, c("Volunteer"))

#This new categories include 18 out of the 23 variables;
#Variables like "Gender","Age", "Marital.St", "Prof" are the variables defining the individuals so they were included in all the subsets
#"N.Act" is a quantitative variable


#Graphical visualization of the data
library(GGally)
library(ggplot2)

pairs(Generic_Hobbies, mapping = aes(col = Gender, alpha = 0.3), lower = list(combo = wrap("facethist", bins = 20)))

ggpairs(data = Generic_Hobbies, mapping = aes(col = Age, alpha = 0.3), lower = list(combo = wrap("facethist", bins = 20)))





#Verify how the main dimensions of the data correlate with each other 


## Not run:
res.mca <- MCA(hobbies,quali.sup=19:22,quanti.sup=23,method="Burt")
plot(res.mca,invisible=c("ind","quali.sup"),hab="quali") ### active var. only
plot(res.mca,invisible=c("var","quali.sup"),cex=.5,label="none") ### individuals only
plot(res.mca,invisible=c("ind","var"),hab="quali") ### supp. qualitative var. only
dimdesc(res.mca)
plotellipses(res.mca,keepvar=1:4)


#Explore how the data pairs with each other for better development of study hypothesis

#Calculated correlation matrix and visualize it for better development of study hypothesis

