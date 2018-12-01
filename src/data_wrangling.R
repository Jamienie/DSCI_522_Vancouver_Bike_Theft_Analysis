# data_wrangling.R
# November 2018

# This script cleans the data by filtering the type = "Theft of Bicycle" and years are
# between 2003 - 2017 (full years).

# This script takes two arguments: a path pointing to the saved data , a path/file name pointing to the clean data 
# and a path where to write the clean data file to. 
#
# Usage: Rscript src/data_wrangling.R "data/crime_csv_all_years.csv" "results/data_all_years_bicycle.csv"  
#
# define main function

suppressPackageStartupMessages(library(tidyverse))

# read in command line arguments
args <- commandArgs(trailingOnly = TRUE)
file_save <- args[1]
file_write <- args[2]

# read the csv file into r
data <- read.csv(file_save) 

main <- function(){
  
   # filter data to `TYPE` = `Theft of Bicycle` only, and years are between 2003 and 2017.
  f <- data %>% 
    filter(TYPE == "Theft of Bicycle" & YEAR %in% (2003:2017)) %>%
    group_by(YEAR,MONTH) %>%
    summarise(n=n())%>%
    mutate(summer = ifelse (MONTH %in% c(6,7,8), "Yes","No"))%>%
    select(YEAR,MONTH,n,summer) # only look at the TYPE, YEAR, MONTH columns for the purpose of this project
  
  write_csv(f, file_write)
  
}


# call main function 
main()
