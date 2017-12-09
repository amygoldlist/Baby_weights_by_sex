
##clean_data.R
##by Amy Goldlist, Decmenber 2017

## Usage:  Rscript src/clean_data.R $orig_filename $new_filename
## the original filename is "data/raw_baby.csv" 
## the target filename is "results/baby_data.csv"




## This script takes the raw data from Stats Canada, and cleans it up
## In particular, the csv contains summary data mixed in with actual data.
## As well, the weights are recorded as a string, and we will extract numbers


# read in command line argument
args <- commandArgs(trailingOnly = TRUE)
input_file <- args[1]
output_file <- args[2]


###load libraries
library(tidyverse)
library(stringr)
library(forcats)

##read in data
raw_data <- read.csv(input_file)
###raw_data <- read.csv("data/raw_baby.csv")





##get rid of the summary data, iun order to clean the analysis
baby_data <- raw_data %>% 
  filter(SEX != "Both sexes") %>% 
  filter(GEO != "Canada, place of residence of mother") %>% 
  filter(BIRTHWEIGHT !="Total, birth weight") %>% 
  filter(BIRTHWEIGHT !="Birth weight, not stated") %>%
  filter(BIRTHWEIGHT !="Birth weight, 2,500 to 4,499 grams") %>%
  filter(BIRTHWEIGHT !="Birth weight, 500 to 1,499 grams") %>%
  filter(BIRTHWEIGHT !="Birth weight, 1,500 to 2,499 grams") %>%
  filter(BIRTHWEIGHT !="Birth weight, 4,500 grams or more" ) %>%
  filter(UNIT == "Number of live births") %>% 
  droplevels()




##get rid of extra characters, in order to recode birth weight as numeric
baby_data <- baby_data %>% 
  mutate(GEO = str_replace(GEO,pattern = ", place of residence of mother", replacement=""),
         BIRTHWEIGHT= str_replace(BIRTHWEIGHT,pattern = "Birth weight, ", replacement=""),
         BIRTHWEIGHT = str_replace(BIRTHWEIGHT, pattern = ",", replacement =""),
         BIRTHWEIGHT = str_replace(BIRTHWEIGHT, pattern = ",", replacement =""),
         Weight_class =BIRTHWEIGHT) %>% 
  separate(BIRTHWEIGHT, c("Weight_low", "to", "Weight_high", "grams"))


## get types back to the correct place
baby_data <- baby_data %>%  
  mutate(GEO = as.factor(GEO),
         Weight_class = as.factor(Weight_class),
         Value = as.character(Value),
         Value = as.integer(Value))  



## Fix up the weights by extracting a boundary, and assigning each class a midpoint
baby_data <- baby_data %>% 
  mutate(Weight_low= as.factor(Weight_low),
    Weight_low = forcats::fct_recode(Weight_low,"0"= "less" ),
    Weight_low= as.character(Weight_low),
    Weight_low= as.integer(Weight_low),
    Weight_high = forcats::fct_recode(Weight_high,"5750"= "or" ), #I've chosen an upper bound
    Weight_high = as.character(Weight_high),
    Weight_high= as.integer(Weight_high),
    Weight_mid = (Weight_high +Weight_low)/2)




##Get everything as the correct type, in order to analyze, and kill the NA values in Value 
baby_data <- baby_data%>% 
  select(Ref_Date, GEO, SEX, Weight_class, Weight_low, Weight_high, Weight_mid, Value) %>% 
  mutate(Weight_class= as.factor(Weight_class)) %>% 
  filter(Value>= 0)

  

##relevel the birthweights properly, so that we can create graphics
baby_data <- baby_data %>% 
  mutate(Weight_class = fct_relevel(Weight_class,c("less than 500 grams", "750 to 999 grams" )))


##write data to a new csv
write_csv(baby_data, output_file)


