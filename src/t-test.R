###t-test.R

##by Amy Goldlist, Decmenber 2017

## Usage:  Rscript src/t-test.R $data $target
## the original filename is "results/summary_stats.csv" 
## the target filename is "results/test_values.txt"




## This script takes the clean data, and finds the summary stats needed to run a t-test 


# read in command line argument
args <- commandArgs(trailingOnly = TRUE)
input_file <- args[1]
output_file <- args[2]


###read in data
summary <- read.csv("results/summary_stats.csv")

##pull out the variables for our t test
mean_f <- summary$mean[1]
mean_m <- summary$mean[2]
var_f <- summary$variance[1]
var_m <- summary$variance[2]
n_f <- summary$count[1]
n_m <- summary$count[2]

##calculate the pooled variance
v_pool <- (var_f*(n_f-1) +var_m*(n_m-1))/(n_f+n_m-2)

##calculate the pooled standard error
se_pool <- sqrt(v_pool)* sqrt(1/n_f+1/n_m)


## test statistic
t_test <- (mean_f-mean_m)/se_pool

t_neg <- -abs(t_test)
##degrees of freedom
nu = n_f+n_m -2

p_value <-2* pt(t_neg, nu)

vector <- c(t_test, p_value)

write(vector, output_file)


