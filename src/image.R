

library(tidyverse)

baby_data <- read_csv("results/baby_data.csv")

baby_data %>% 
  group_by(SEX, Weight_class) %>% 
  filter(Value >= 0) %>% 
  summarize(count = sum(Value)) %>% 
  ggplot(aes(x = Weight_class, y = count, fill = SEX))+
  geom_col()

  

  