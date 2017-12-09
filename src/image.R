
##image.R
##by Amy Goldlist, Decmenber 2017

## Usage:  Rscript src/image.R $orig_filename $new_filename
## the origina filename is "results/baby_data.csv"
## the target filename is "results/images/baby_histogram.png"


##This script created png file with a histogram of the data, grouped by sex

# read in command line argument
args <- commandArgs(trailingOnly = TRUE)
input_file <- args[1]
output_file <- args[2]



###load tidyverse
library(tidyverse)
library(forcats)

##load data
###baby_data <- read.csv("results/baby_data.csv")
baby_data <- read.csv(input_file)

##relevel the birthweights properly, so that we can create graphics
baby_data <- baby_data %>% 
  mutate(Weight_class = fct_relevel(Weight_class,c("less than 500 grams", "750 to 999 grams" )))

 
##create barplot of baby weights by sex
p <- baby_data %>% 
  filter(Value >=0) %>% 
  group_by(SEX, Weight_class) %>% 
  summarize(count = sum(Value)) %>% 
  ggplot(aes(x = Weight_class, y = count, fill = SEX))+
  geom_col(position = "dodge")+
  theme_minimal()+
  scale_y_continuous(name = "Count", labels = scales::comma)+
  scale_x_discrete(name = "Birthweight")+
  theme(axis.text.x = element_text(angle = 70, hjust = 1))+
  labs(title = "Birthweights by Sex")



ggsave(output_file, p)

