# Baby weights by sex
## Do girls weigh more than boys at birth?
### Amy Goldlist

What are the differences between male and female babies at birth?  Is there a size difference?  I've used the data set ["Live births, by birth weight and sex, Canada, provinces and territories"](http://open.canada.ca/data/en/dataset/ea67173c-4f76-4259-83e5-557e97ae85fd) available through the Government of Canada Open Data website.  This dataset contains data on babies born between 2000 and 2014, classified by sex and weight range.

My hypothesis is that female babies weigh more than male babies at birth.  

I will analyze this data by creating some visualizations (histograms, and boxplots), which plot baby boys and girls separately.  Depending on my estimated summary statistics (as the weights are given as ranges, instead of exact weights), it may be appropriate to perform a t-test on the data to see if the distribution of male and female weights are different.

Given enough time, I may look at the effect of time, over the 14 years that the project takes place, as well as visualizing any effects of province.



#### List of files:

| file   | Description |
|--------|-------------|
| [README](README.md) |   *Overview of project*    |
| [LICENSE](LICENSE.md) |   *MIT license here*    |
| [Raw data](data/01023509_eng.csv) | *Here is the CSV downloaded from the government website* |
| [A basic script](src/Open_data.R) | *A script to open data and summarize.* |


#### Details

  The data used is licensed under an [Open Government License- Canada](http://open.canada.ca/en/open-government-licence-canada)
