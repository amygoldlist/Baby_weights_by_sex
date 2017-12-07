###t-test

### 


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
##check this??

## test statistic
t_test <- (mean_f-mean_m)/se_pool

##degrees of freedom
nu = n_f+n_m -2

