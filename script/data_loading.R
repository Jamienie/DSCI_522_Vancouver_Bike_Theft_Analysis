# data_loading.R
# Fan and Makk , November 2018
# crime_csv_all_years.csv

# This script loads the dataset "crime_csv_all_years.csv". 
# This script takes no arguments.
#
# Usage: Rscript data_loading.R
#

library(tidyverse)
#library(infer)
#library(repr)

  # read in data
  data <- read.csv('./data/crime_csv_all_years.csv')
  