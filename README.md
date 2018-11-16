# Vancouver_Bike_Theft_Analysis
Analysis of bike theft reports in Vancouver between 2003-2017.

1. Choose a public data set from the web that you are interested in to carry out a small data analysis. You may also use any data set we have previously worked with in MDS. Prove to us that you can load the data set into R or Python (this could be demonstrating by writing a script that downloads the data and saves a snippet of it, for example).

* Dataset is of crime data between 2003 and 2017 in Vancouver reported by the Vancouver Police Department.
Link: https://data.vancouver.ca/datacatalogue/crime-data.htm

2. With that data set, identify a question you would like to ask from it that could be answered by some simple analysis and visualization (more on this below). State what kind of question it is (it should be one of the 6 types discussed in lecture 1).

* Question: Do bicycle thefts peak/increase in the summer months (June,July,August) compared to other months of the year?

* The question is inferential and will be answered using a hypothesis test.

3. Make a plan of how you will analyze the data (report an estimate and confidence intervals? hypothesis test? classification with a decision tree?). Choose something you know how to do (report an estimate and confidence intervals, a two-group hypothesis), or will learn how to do in the first week of block 3 (ANOVA, classification with a decision tree).

* The plan to answer the question using a one-tailed two-group hypothesis test where: 
- Null hypothesis: No difference in bike theft reports between summer months (June,July,August) and the other months of the year.
- Alternative hypothesis: Higher number of bike theft reports in the summer months when compared to the other months of the year.

4. Suggest how you might summarize the data to show this as a table or a number, as well as how you might show this as a visualization.

- Data wrangling to filter the type of crime, and group by months/time-frame
- Summarize average of bike thefts by time-frame
- Visualize exploratory line graph (Month vs. Number of thefts)
- Hypothesis test:
    * Plot distribution of the null-hypothesis (that there is no difference in the means)
    * Find where our sample mean lies on the distribution
    * Reject or accept the null hypothesis based on this information
