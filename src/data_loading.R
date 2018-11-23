# data_loading.R
# Fan and Makk , November 2018
# crime_csv_all_years.csv

# This script downloads the dataset "crime_csv_all_years.zip" from 
# "ftp://webftp.vancouver.ca/opendata/csv/crime_csv_all_years.zip", and unzip the .zip file
# This script takes two arguments: the url of the data file, and the absolute file path to save the unzipped file into.
#
# Usage: Rscript data_loading.R "ftp://webftp.vancouver.ca/opendata/csv/crime_csv_all_years.zip" "C:/Users/fanfan/Documents/block3/DSCI_522_project/DSCI_522_Vancouver_Bike_Theft_Analysis/data"
#

library(tidyverse)

# read in command line arguments
args <- commandArgs(trailingOnly = TRUE)
file_url <- args[1]
file_save <- args[2]

# define main function
main <- function(){

# read in data
url = file_url
download.file(url, "crime_csv_all_years.zip") # download file
unzip("crime_csv_all_years.zip", exdir = file_save) # unzip files
file.remove("crime_csv_all_years.zip") # tidy up by removing the zip file
}

# call main function
main()