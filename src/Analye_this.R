library(tidyverse)
library(stringr)

raw_data <- read_csv("../data/01023509_eng.csv")


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

#summarize(baby_data)


##get rid of the summary data
baby_cleaner <- baby_data %>% 
  filter(SEX != "Both sexes") %>% 
  filter(GEO != "Canada, place of residence of mother") %>% 
  filter(BIRTHWEIGHT !="Total, birth weight") %>% 
  filter(UNIT == "Number of live births")

##get rid of extra characters!
baby_cleanest <- baby_cleaner %>% 
  mutate(GEO = str_replace(GEO,pattern = ", place of residence of mother", replacement=""),
         BIRTHWEIGHT= str_replace(BIRTHWEIGHT,pattern = "Birth weight, ", replacement=""),
         WEIGHT_LOW= str_split(BIRTHWEIGHT, pattern = " "),
         WEIGHT_LOW = forcats::fct_recode(BIRTHWEIGHT,"0"= "less than 500 grams" ))


baby_cleanest %>% 
  filter(WEIGHT_LOW!=0)



baby_cleaner$BIRTHWEIGHT %>% 
  str_split(pattern = " ")

baby_cleaner %>% 
  mutate(GEO = str_replace(GEO,pattern = ", place of residence of mother", replacement=""))



#fct_recode("UK"= "United Kingdom", "Czech"= "Czech Republic", "Slovak" = "Slovak Republic") %>% 
  
 # str_replace(pattern = " 4,", replacement = " 04,") %>% 