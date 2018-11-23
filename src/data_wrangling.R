# data_wrangling.R
# November 2018
# crime_csv_all_years.csv

# This script cleans the data by filtering the type = "Theft of Bicycle" and years are
# between 2003 - 2017 (full years).

# # This script takes two arguments: the absolute file path to save the unzipped file into, , and the clean data file path. 
#
# Usage: Rscript data_wrangling.R 
#        "C:/Users/fanfan/Documents/block3/DSCI_522_project/DSCI_522_Vancouver_Bike_Theft_Analysis/data/crime_csv_all_years.csv"
#        "C:/Users/fanfan/Documents/block3/DSCI_522_project/DSCI_522_Vancouver_Bike_Theft_Analysis/data/data_all_years_bicycle.csv"  
#
# define main function

library(tidyverse)

# read in command line arguments
args <- commandArgs(trailingOnly = TRUE)
file_save <- args[1]
file_write <- args[2]

# read the csv file into r
data <- read.csv(file_save) 

main <- function(){
  
   # filter data to `TYPE` = `Theft of Bicycle` only, and years are between 2003 and 2017.
  data %>% 
    filter(TYPE == "Theft of Bicycle" & YEAR %in% (2003:2017)) %>%
    select(TYPE,YEAR,MONTH) %>% # only look at the TYPE, YEAR, MONTH columns for the purpose of this project
    group_by(YEAR,MONTH) %>%
    summarise(n=n()) # count the numbers of bicycle thefts reported in each month in each year
  
}


# call main function and output command
data_all_years_bicycle <- main()
write_csv(data_all_years_bicycle, file_write)
