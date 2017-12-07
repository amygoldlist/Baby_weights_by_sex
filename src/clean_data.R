

###load libraries
library(tidyverse)
library(stringr)
library(forcats)


raw_data <- read_csv("data/01023509_eng.csv")



##change types to factor to recode

baby_data <- raw_data %>% 
  mutate(SEX = as.factor(SEX),
         GEO = as.factor(GEO),
         BIRTHWEIGHT = as.factor(BIRTHWEIGHT),
         UNIT = as.factor(UNIT))  




##get rid of the summary data
baby_data <- baby_data %>% 
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



##get rid of extra characters!
baby_data <- baby_data %>% 
  mutate(GEO = str_replace(GEO,pattern = ", place of residence of mother", replacement=""),
         BIRTHWEIGHT= str_replace(BIRTHWEIGHT,pattern = "Birth weight, ", replacement=""),
         BIRTHWEIGHT = str_replace(BIRTHWEIGHT, pattern = ",", replacement =""),
         BIRTHWEIGHT = str_replace(BIRTHWEIGHT, pattern = ",", replacement =""),
         Weight_class =BIRTHWEIGHT) %>% 
  separate(BIRTHWEIGHT, c("Weight_low", "to", "Weight_high", "grams"))



##fix up those pesky weights!  
baby_data <- baby_data %>% 
  mutate(Weight_low= as.factor(Weight_low),
    Weight_low = forcats::fct_recode(Weight_low,"0"= "less" ),
    Weight_low= as.character(Weight_low),
    Weight_low= as.integer(Weight_low),
    Weight_high = as.character(Weight_high),
    Weight_high= as.integer(Weight_high),
    Weight_mid = (Weight_high +Weight_low)/2)



##Get everything as the correct type 
baby_data <- baby_data%>% 
  select(Ref_Date, GEO, SEX, Weight_class, Weight_low, Weight_high, Weight_mid, Value) %>% 
  mutate(GEO =as.factor(GEO),
         Weight_class= as.factor(Weight_class))

##get rid of NA values in Value
baby_data <- baby_data %>% 
  filter(Value>= 0)

##recode the birthweights properly
#levels(baby_data$Weight_class)

baby_data <- baby_data %>% 
  mutate(Weight_class = fct_relevel(Weight_class,c("less than 500 grams", "750 to 999 grams" )))




##write data to a new csv
write_csv(baby_data, "results/baby_data.csv")


