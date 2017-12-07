###load tidyvers
library(tidyverse)
library(SDMTools)

##load data
baby_data <- read.csv("results/baby_data.csv")

str(baby_data)

###fix is.na values on 


baby_data %>% 
  arrange(Value) %>% 
  head()


baby_data %>% 
  group_by(SEX) %>% 
  summarize(mean = sum(Weight_mid*Value)/sum(Value),
            variance = wt.var(Weight_mid, Value),
            standard_deviation = sqrt(variance),
            count = sum(Value))

