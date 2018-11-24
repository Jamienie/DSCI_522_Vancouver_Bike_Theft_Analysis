# Vancouver Bike Theft Analysis
Analysis of bike theft reports in Vancouver between 2003-2017.

## Team Members | Github.com username:
* Fan Nie | Jamienie
* Mohamad Makkaoui | makka3

## Introduction
Even in an age of CCTV cameras on every street corner, bike theft remains an issue that continues to plague most modern cities. 
Vancouver, Canada is no exception and there are often hundreds of bike theft reports every month. The Vancouver Police Department has 
collected data on bike thefts going back to 2003, with data such as date, time, and location of all bike thefts in the greater Vancouver area.
Using this data, we will be investigating whether there is a greater incidence of bike thefts in the summer time when compared to the remaining months of the year.
(Note: for the purposes of the analysis, 'summer time' is chosen as the months June, July, August for simplicity). 

## Dataset

* The source of the dataset is available publicly on [Vancouver Open Data Catalogue](https://data.vancouver.ca/datacatalogue/crime-data.htm). It is crime data in Vancouver from 2003 till present (updated every Sunday morning) reported by the Vancouver Police Department. The dataset we use is as of November 16,2018.
* The original dataset was in csv format. For this project, we will use R to import and handle our data analysis.
* Imported data can be found [here](https://github.com/UBC-MDS/DSCI_522_Vancouver_Bike_Theft_Analysis/tree/master/script), in the src folder of our repository, and a snippet of it can be found [here](https://github.com/UBC-MDS/DSCI_522_Vancouver_Bike_Theft_Analysis/tree/master/img).

## Question

* Is the mean number of bikes stolen per month in the summer time (June, July, August) **greater** than the mean number of bikes stolen per month during the other months of the year? 

#### Variables

* Number of bikes stolen per month: Continuous
* Summer/Not Summer: Categorical

## Analysis Plan

* Counting the number of bike thefts for each month since 2003
* Group the months into summer/non-summer
* Compute difference in means statistic between the summer and non-summer groups using a t-test
* Accept/Reject null hypothesis based on p-value

* We will define our null and alternative hypotheses (a one-tailed two-group hypothesis): 
  * Null hypothesis: No difference in bike theft reports between summer months (June,July,August) and the other months of the year.
  * Alternative hypothesis: Higher number of bike theft reports in the summer months when compared to the other months of the year.

## Visualization
- Visualize exploratory line graph, Month vs. Number of thefts for all years from 2003 to 2017
- Box plot showing the median, first/third quartile, min/max and outliers

## Usage

1. Clone this repo, navigate to the root of the project
2. Run the following commands

```
Rscript data_loading.R "ftp://webftp.vancouver.ca/opendata/csv/crime_csv_all_years.zip"   "../data"
Rscript data_wrangling.R "../data/crime_csv_all_years.csv" "../data/data_all_years_bicycle.csv"
Rscript data_analysis.R "../data/data_all_years_bicycle.csv"  "../results/analysis_summary.csv" 
Rscript data_viz_exploratory.R "../data/data_all_years_bicycle.csv"  "../results/viz_exploratory.png"
Rscript data_viz_final.R "../data/data_all_years_bicycle.csv" "../results/bike_boxplot.png"
Rscript -e "rmarkdown::render('doc/vancouver_bike_report.Rmd')"
```

## Dependencies
- R & R libraries:
	- 'rmarkdown'
	- 'here'
	- 'knitr'
	- 'ggplot2'
	- 'tidyverse'