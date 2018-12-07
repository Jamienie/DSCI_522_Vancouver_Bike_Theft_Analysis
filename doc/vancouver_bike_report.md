Vancouver Bike Theft Report
================
Fan Nie, Mohamad Makkaoui

## Introduction

Even in an age of CCTV cameras on every street corner, bike theft
remains an issue that continues to plague most modern cities. Vancouver,
Canada is no exception and there are often hundreds of bike theft
reports every month \[1\]. The Vancouver Police Department has collected
thorough data on bike thefts, with information on date, time, and
location of all bike thefts in the greater Vancouver area going back to
2003 \[2\]. We looked at this data and analyzed it in an attempt to
uncover insights about this phenomenon that may potentially help tackle
and reduce bike theft in the region.

## Objective

Our question is straightforward, taking only the date information, we
are investigating whether there is a greater incidence of bike thefts in
the summer time when compared to the remaining months of the year.

We make a few assumptions for the purposes of simplicity in the
analysis. First, ‘summer time’ is chosen as the months June, July,
August as these months are months with the least precipitation and a
time when people are generally outdoors in Vancouver. We also assume
that the bike thefts that are reported are representative of the actual
number of bikes stolen.

## Exploratory Data Analysis

As part of our preliminary exploration, we wanted to look at the number
of bike thefts per month against time for as long back as the data goes.
This would help identify any trends or changes in the number of bike
thefts that could be attributed to a particular time frame. So we
plotted the months of the year vs the number of bike thefts per month,
and facetted by year for 15 years.

<img src="../results/figures/viz_exploratory.png" width="60%" />

**Figure 1**: Month vs. Number of bike thefts per month over 15 years

Looking at Figure 1 above, it appears as though there is a
non-negligible hump as summer time approaches every year followed by a
subsequent drop off as the fall begins.

## Analysis & Results

We wanted to investigate whether this difference is statistically
significant. Our question became the following:

Is the mean number of bikes stolen per month in the **summer time**
(June, July, August) *greater* than the mean number of bikes stolen per
month during the **other months of the year** or are they equal?

So we defined our null and alternative hypotheses (a one-tailed
two-group hypothesis) as:

  - Null hypothesis \(H_0\): No difference in bike theft reports between
    summer months (June,July,August) and the other months of the year.

  - Alternative hypothesis \(H_A\): Higher number of bike theft reports
    in the summer months when compared to the other months of the year.

Our exploratory variable is the binary variable, **‘Summer’** or **‘Not
Summer’**

To test whether there is a statistically significant difference between
the summer and non-summer groups, we used a **t-test** on the difference
in means between the two groups. We assume the variances between the two
groups are not
equal.

|   estimate | estimate1 | estimate2 |  statistic | p.value | parameter | conf.low |  conf.high | method                  |
| ---------: | --------: | --------: | ---------: | ------: | --------: | -------: | ---------: | :---------------------- |
| \-135.2519 |  115.8815 |  251.1333 | \-8.876774 |       0 |   59.4157 |    \-Inf | \-109.7929 | Welch Two Sample t-test |

**Table 1**: Summary of t-test results

As we can see from the summary table above, the difference in the mean
estimates between the groups is substantially large. The p-value is
infinitesmally small, and the null hypothesis is rejected. Thus, we can
conclude with confidence that there is a higher incidence of bike thefts
in the summer time. Figure 2 below highlights the differences between
the two groups.

<img src="../results/figures/bike_boxplot.png" width="60%" />

**Figure 2**: Jitter/Violin plot comparing the number of reported bike
thefts for summer and non-summer months in the last 15 years. The red
error bars represent the 95% confidence intervals.

## Conclusion

In the analysis performed above, we show conclusively that there is
indeed a spike in bike theft incidence in the summer time looking at
Vancouver Police Department data going back the last 15 years. This
analysis was straightforward and was expected given our exploratory
analysis and eye-test results.

## Future Scope

To make this analysis better and more thorough/useful, we can compound
datetime data with location data to pinpoint exactly the locations and
time of day/year where the risk of bike thefts is highest. This could
help the VPD alert locals and help protect people’s property.

## References

1.  Robinson, Matt. (2018). *Bike thieves target UBC students at start
    of school year* \[Online\], vancouversun.com. Available at:
    <https://vancouversun.com/news/local-news/bike-theft> \[Accessed 23
    Nov. 2018\]

2.  *Vancouver Crime Data*, data.vancouver.ca. \[Online\] Available at:
    <https://data.vancouver.ca/datacatalogue/crime-data.htm> \[Accessed
    16 Nov. 2018\]
