#! /usr/bin/env Rscript 
# Open_data.Rscript
# Amy Goldlist, Nov 2017
#
# This Script opens the data file and looks at things
# Usage:  run and it will open the data file.



#reads in data
baby_data <- read.csv("data/01023509_eng.csv")

#sumarizes the data
summary(baby_data)



