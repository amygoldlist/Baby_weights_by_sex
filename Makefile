##Makefile

##Amy Goldlist, December 2017

### this completes my anaylsis, by taking the raw data, cleaning it
### summarizes the data
### creates a histogram of values
### runs a t test to show that there is a diffenrece in baby wieghts by sex

##run top to bottom
all: doc/baby_report.md

## clean data
results/baby_data.csv: data/raw_baby.csv src/clean_data.R
	Rscript src/clean_data.R data/raw_baby.csv results/baby_data.csv

##create summery stats
results/summary_stats.csv: results/baby_data.csv src/summary_stats.R
	Rscript src/summary_stats.R results/baby_data.csv results/summary_stats.csv

##histogram
results/images/baby_histogram.png: results/baby_data.csv src/image.R
	Rscript src/image.R results/baby_data.csv results/images/baby_histogram.png

##t-test of pooled variances
results/test_values.txt: results/summary_stats.csv src/t-test.R
	Rscript src/t-test.R results/summary_stats.csv results/test_values.txt

##create report
doc/baby_report.md: src/baby_report.Rmd results/summary_stats.csv results/test_values.txt results/images/baby_histogram.png
	Rscript -e "ezknitr::ezknit('src/baby_report.Rmd', out_dir = 'doc')"


##clean up intermediate files.
clean:
	rm -f results/baby_data.csv
	rm -f results/summary_stats.csv
	rm -f results/images/baby_histogram.png
	rm -f results/test_values.txt
	rm -f doc/baby_report.md
