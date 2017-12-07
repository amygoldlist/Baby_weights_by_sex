###load tidyvers
library(tidyverse)
library(SDMTools)

##load data
baby_data <- read.csv("results/baby_data.csv")


baby_data %>% 
  arrange(Value) %>% 
  head()


summary_stats <- baby_data %>% 
  group_by(SEX) %>% 
  summarize(mean = sum(Weight_mid*Value)/sum(Value),
            variance = wt.var(Weight_mid, Value),
            standard_deviation = sqrt(variance),
            count = sum(Value))

write.csv(summary_stats, "results/summary_stats.csv")

