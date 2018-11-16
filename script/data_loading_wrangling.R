# data_loading_wrangling.R
# Fan and Makk , November 2018
# crime_csv_all_years.csv

# This script performs analysis of bike theft reports in Vancouver between 2003-2017
# This script takes no arguments.
#
# Usage: Rscript data_loading_wrangling.R
#
# define main function

library(tidyverse)
#library(infer)
#library(repr)
main <- function(){
  
  # read in data
  data <- read.csv('./data/crime_csv_all_years.csv')
 
  # filter data to `TYPE` = `Theft of Bicycle` only, and group by `MONTH and YEAR`
  data_all_years_bicycle <- data %>% 
    filter(TYPE == "Theft of Bicycle") %>%  
    select(TYPE,YEAR, MONTH) %>%
    group_by(YEAR,MONTH)%>%
    summarize(n=n())
<<<<<<< HEAD
  str(data_all_years_bicycle)
=======
>>>>>>> upstream/master
}


# call main function
main()
