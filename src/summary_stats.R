
##summary_stats.R
##by Amy Goldlist, Decmenber 2017

## Usage:  Rscript src/summary_stats.R $data $new_filename
## the original filename is "results/baby_data.csv" 
## the target filename is "results/summary_stats.csv"




## This script takes the clean data, and finds the summary stats needed to run a t-test 


# read in command line argument
args <- commandArgs(trailingOnly = TRUE)
input_file <- args[1]
output_file <- args[2]



###load libraries needed
library(tidyverse)
library(SDMTools)

##load data
##baby_data <- read.csv("results/baby_data.csv")
baby_data <- read.csv(input_file)

baby_data %>% 
  arrange(Value) %>% 
  head()



summary_stats <- baby_data %>% 
  group_by(SEX) %>% 
  summarize(mean = sum(Weight_mid*Value)/sum(Value),
            variance = wt.var(Weight_mid, Value),
            standard_deviation = sqrt(variance),
            count = sum(Value))

##write.csv(summary_stats, "results/summary_stats.csv")
write.csv(summary_stats, output_file)
