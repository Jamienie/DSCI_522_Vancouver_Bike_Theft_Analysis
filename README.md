# Vancouver_Bike_Theft_Analysis
Analysis of bike theft reports in Vancouver between 2003-2017.

## Team Members:
* Fan Nie
* Mohamad Makkaoui

## Dataset

* The source of the dataset is available publicly on [Vancouver Open Data Catalogue](https://data.vancouver.ca/datacatalogue/crime-data.htm). It is crime data in Vancouver from 2003 till present (updated every Sunday morning) reported by the Vancouver Police Department. The dataset we use is as of November 16,2018.
* The original dataset was in csv format. For this project, we will use R to import and handle our data analysis.
* Imported data can be found [here](https://github.com/UBC-MDS/DSCI_522_Vancouver_Bike_Theft_Analysis/tree/master/script), in the src folder of our repository, and a snippet of it can be found [here](https://github.com/UBC-MDS/DSCI_522_Vancouver_Bike_Theft_Analysis/tree/master/img).

## Question

* Do bicycle thefts peak/increase in the summer months (June,July,August) compared to other months of the year?

* Type: inferential

## Analysis Plan

* We will define our null and alternative hypotheses (a one-tailed two-group hypothesis): 
  * Null hypothesis: No difference in bike theft reports between summer months (June,July,August) and the other months of the year.
  * Alternative hypothesis: Higher number of bike theft reports in the summer months when compared to the other months of the year.
* We will compute a test statistic that corresponds to the null hypothesis.
* We will generate the simulated data under the model of the null hypothesis and calculate the 2.5th and 97.5th quantile of this distribution (which corresponds to a threshold of 0.05).
* We will calculate p-value.

## Summary Presentation

- Visualize exploratory line graph (Month vs. Number of thefts)
- Plot distribution of the null-hypothesis (that there is no difference in the means)
- Find where our sample mean lies on the distribution
- Reject or accept the null hypothesis based on this information
