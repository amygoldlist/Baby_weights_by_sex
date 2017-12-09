---
title: "Baby Weight by Sex Analysis"
author: "Amy Goldlist"
date: "December 2017"
output: github_document
---





## A Question: do weight differences between the sexes begin at birth?


What are the differences between male and female babies at birth?  Is there a size difference? It is clear that adult males weigh more, on average than adult females, but what is unclear is whether this weight differnece is present from birth.  In fact, as a friend to manyy babies, it seems that annecdotally, people seem to think that baby girls might weigh more than baby boys.

## Some data

In order to analyze this problem, I've used the data set ["Live births, by birth weight and sex, Canada, provinces and territories"](http://open.canada.ca/data/en/dataset/ea67173c-4f76-4259-83e5-557e97ae85fd) available through the Government of Canada Open Data website.  This dataset contains data on babies born between 2000 and 2014, classified by sex and weight range, as well as the province or territory of birth.  In order to have clean analysis, I have cleaned the data to omit any unclassified babies (some homebirths are not catagorized by weight).Since the data is grouped in classes, instead of having exact weights, I've assigned each weight class a midpoint, in order to treat the data as quantitative data.  This is a large dataset, with around 9000 classes representing about 5.38 million Canadian babies.

## A hypothesis.

I was working from the assumption that female babies weigh more on average at birth than male babies, however, in order to rigorously test my hypothesis, I have tested the null hypothesis that the average weight of male babies is the same as the average weight of female babies.

## First, a visualization:

![](results/images/baby_histogram.png)

Right away, it is clear that both the male and female distributions are approximately normal.  However, it seems like the normal curve for the male baby weights is further to the right than the female weight curve.  We can see this more clearly by looking at the summary statistics for the dataset:


```
##       SEX     mean variance standard_deviation   count
## 1 Females 3316.408 325697.2           570.6989 2619639
## 2   Males 3431.969 361956.1           601.6279 2759839
```

All units are in grams.  This sumamry shows us that the mean weight of male babies is slightly higher for male babies as for female babies. Right away, I will admit that my hypothesis, which was based on anecdotes, is probably not correct.  It is more likely that male babies weigh more on average than female babies, and indeed, since our data set is so large, we will be able to show this, even though the difference in average weights is only 115.56 grams.

## Some Statistics

This problem is a textbook example of when we can do a t test of two samples with pooled variances.  As we can see from the above table, the variances are quite close, and as the histogram shows us, both distributions are approximately normal.  Using the base formulae, since we are working on grouped data, our test has a very large negative t test of: 


```
## [1] -228.3171
```

Which unsurprisingly has a p-value of:

```
## [1] 0
```
This shows that there is overwhelming evidence that average weight of male babies is not equal to the average weight of female babies. (p<0.0001)

## A conclusion

It is clear from the size and completeness of our dataset, and the largeness of the test statistic that female babies and male babies do not have the same average weight at birth.  This is statistically significant, but is it actually significant?  I believe that it is, A difference of over 100 grams is significant in very small babies, who may way only 2000 grms or less at birth.  So even though it turns out that my hypothesis was incorrect, we have been able to find a difference in baby weights between the two sexes.
