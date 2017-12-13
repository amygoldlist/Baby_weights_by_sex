### `src`

#### Report

##### [baby_report.Rmd](baby_report.md)
This R Markdown file creates the report, and lays out the conclusions.

Usage: `Rscript -e "ezknitr::ezknit('src/baby_report.Rmd', out_dir = 'doc')"`


#### Scripts

This folder contains the scripts used for analysis.

##### [clean_data.R](clean_data.R)
This is an R script which cleans the raw data.

Usage: `Rscript src/clean_data.R data/raw_baby.csv results/baby_data.csv`

##### [summary_stats.R](summary_stats.R)
This is an R script which takes the cleaned data and calculates the summary statistics needed for the t test.

Usage:  `Rscript src/summary_stats.R results/baby_data.csv results/summary_stats.csv`

##### [image.R](image.R)
This R script created a histogram which shows hte distribution of baby weights, broken down by sex.

Usage: `Rscript src/image.R results/baby_data.csv results/images/baby_histogram.png`

##### [t-test.R](t-test.R)
This script takes the summary statistics, and computes a manual t test.  Since the data is grouped, the t.test command in R will not suiffice.

Usage: `Rscript src/t-test.R results/summary_stats.csv results/test_values.txt`
