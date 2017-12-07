

###load tidyvers
library(tidyverse)

##load data
baby_data <- read.csv("results/baby_data.csv")

 
##create barplot of baby weights by sex
p <- baby_data %>% 
  filter(Value >=0) %>% 
  group_by(SEX, Weight_class) %>% 
  summarize(count = sum(Value)) %>% 
  ggplot(aes(x = Weight_class, y = count, fill = SEX))+
  geom_col(position = "dodge")

ggsave("results/images/baby_histogram.png", p)

