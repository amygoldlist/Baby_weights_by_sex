library(tidyverse)
library(stringr)

raw_data <- read_csv("../data/01023509_eng.csv")

getwd()

##explore data

baby_data <- raw_data %>% 
  mutate(SEX = as.factor(SEX),
         GEO = as.factor(GEO),
         BIRTHWEIGHT = as.factor(BIRTHWEIGHT),
         UNIT = as.factor(UNIT))  


levels(baby_data$SEX)
levels(baby_data$GEO)
levels(baby_data$BIRTHWEIGHT)
levels(baby_data$UNIT)




##get rid of the summary data
baby_data <- baby_data %>% 
  filter(SEX != "Both sexes") %>% 
  filter(GEO != "Canada, place of residence of mother") %>% 
  filter(BIRTHWEIGHT !="Total, birth weight") %>% 
  filter(BIRTHWEIGHT !="Birth weight, not stated") %>% 
  filter(UNIT == "Number of live births")

##get rid of extra characters!
baby_data <- baby_data %>% 
  mutate(GEO = str_replace(GEO,pattern = ", place of residence of mother", replacement=""),
         BIRTHWEIGHT= str_replace(BIRTHWEIGHT,pattern = "Birth weight, ", replacement="")) %>% 
  separate(BIRTHWEIGHT, c("Weight_low", "to", "Weight_high", "grams"))



##fix up those pesky weights!  
baby_data <- baby_data %>% 
  select(Ref_Date, GEO, SEX, Weight_low, Weight_high, Value) %>% 
  mutate(Weight_low= as.factor(Weight_low),
    Weight_low = forcats::fct_recode(Weight_low,"0"= "less" ),
    Weight_low= as.character(Weight_low),
    Weight_low= as.numeric(Weight_low),
    Weight_high= as.numeric(Weight_high),
    Weight_mid = (Weight_high +Weight_low)/2)

##write data to a new csv
write_csv(baby_data, "../results/baby_data.csv")


