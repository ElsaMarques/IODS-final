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

#Remove all the data that is nor complete
#Meaning remove all the 1498 NA's and respective data row

# Filter out all rows with NA values
hobbies_ <- na.omit(hobbies_)
hobbies_

# Make subsets of data according to the type of data

# Define the variable Generic_Hobbies that will include c("Read", "L.Music", "Cinema", "Comp", "TV", "Gender","Age", "Marital.St", "Prof")
Generic_Hobbies <- dplyr::select(hobbies_, c("Read", "L.Music", "Cinema", "Comp", "TV", "Gender","Age", "Marital.St", "Prof"))

# Define the variable Artistic_Hobbies that will include c("Show", "Exhib", "Play.M", "Collect", "Gender","Age", "Marital.St", "Prof")
Artistic_Hobbies <- dplyr::select(hobbies_, c("Show", "Exhib", "Play.M", "Collect", "Gender","Age", "Marital.St", "Prof"))

# Define the variable Sport_Hobbies that will include c("Sport", "Walk" , "Travel", "Fish", "Gender","Age", "Marital.St", "Prof")
Sport_Hobbies <- dplyr::select(hobbies_, c("Sport", "Walk" , "Travel", "Fish", "Gender","Age", "Marital.St", "Prof"))

# Define the variable Handcraft_Hobbies that will include c("Mech", "Garden", "Knitt", "Cook")
Handcraft_Hobbies <- dplyr::select(hobbies_, c("Mech", "Garden", "Knitt", "Cook", "Gender","Age", "Marital.St", "Prof"))

# Define the variable Charity_Hobbies that will include c("Volunteer")
Charity_Hobbies <- dplyr::select(hobbies_, c("Volunteer", "Gender", "Age", "Marital.St", "Prof"))

#This new categories include 18 out of the 23 variables;
#Variables like "Gender","Age", "Marital.St", "Prof" are the variables defining the individuals so they were included in all the subsets
#"N.Act" is a quantitative variable


#save main modified data as .CSV
write.csv(hobbies_, file = "hobbies_.csv" )

#save the subcategories / selected set as .CSV
write.csv(Generic_Hobbies, file = "Generic_Hobbies.csv")
write.csv(Artistic_Hobbies, file = "Artistic_Hobbies.csv")
write.csv(Sport_Hobbies, file = "Sport_Hobbies.csv")
write.csv(Handcraft_Hobbies, file = "Handcraft_Hobbies.csv")
write.csv(Charity_Hobbies, file = "Charity_Hobbies.csv")

