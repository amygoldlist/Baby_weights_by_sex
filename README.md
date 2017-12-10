# Baby weights by sex
## Do girls weigh more than boys at birth?
### Amy Goldlist

What are the differences between male and female babies at birth?  Is there a size difference?  I've used the data set ["Live births, by birth weight and sex, Canada, provinces and territories"](http://open.canada.ca/data/en/dataset/ea67173c-4f76-4259-83e5-557e97ae85fd) available through the Government of Canada Open Data website.  This dataset contains data on babies born between 2000 and 2014, classified by sex and weight range.

My hypothesis on starting was that female babies weigh more than male babies at birth, but in fact my analysis has shown that male babies weigh more on average than female babies at birth!

In the next release, I would like to look at the effect of province or territory or birth on birthweights.


### To Run:

Clone the repo, and run the make file using the command
```
make all
```
This will clean the data, create images, and run the analysis.  It will them compile this into a report.  The Make file runs the data as in this dependency graph:

![](results/images/make_graph.png)

### List of key files:

| file   | Description |
|--------|-------------|
| [README](README.md) |   *Overview of project*    |
| [LICENSE](LICENSE.md) |   *MIT license here*    |
| [Report](doc/baby_report.md) | *A completed report on baby weights* |
| [Makefile](Makefile) | *A make file to run everything*

### Dependencies
The analysis is done with R, (3.4.3), with the following packages:

* library(tidyverse)
* library(stringr)
* library(forcats)
* library(SDMTools)
* library(scales)
* library(ezknitr)

The documents are rendered with Make.

### Licensing Details

  The data used is licensed under an [Open Government License- Canada](http://open.canada.ca/en/open-government-licence-canada)
