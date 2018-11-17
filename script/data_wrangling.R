# data_wrangling.R
# November 2018
# crime_csv_all_years.csv

# This script cleans the data by filtering the type = "Theft of Bicycle" and years are
# between 2003 - 2017 (full years).

# This script takes no arguments.
#
# Usage: Rscript data_wrangling.R
#
# define main function

library(tidyverse)
#library(infer)
#library(repr)
main <- function(){
  
  # filter data to `TYPE` = `Theft of Bicycle` only, and years are between 2003 and 2017.
  data_all_years_bicycle <- data %>% 
    filter(TYPE == "Theft of Bicycle" & YEAR %in% (2003:2017)) %>%
    select(TYPE,YEAR,MONTH) %>% # only look at the TYPE, YEAR, MONTH columns for the purpose of this project
    group_by(YEAR,MONTH) %>%
    summarise(n=n()) # count the numbers of bicycle thefts reported in each month in each year
}


# call main function
main()
