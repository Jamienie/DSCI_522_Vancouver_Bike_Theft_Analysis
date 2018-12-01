# data_loading.R
# Fan and Makk, November 2018

# This script downloads the dataset "crime_csv_all_years.zip" from 
# "ftp://webftp.vancouver.ca/opendata/csv/crime_csv_all_years.zip", and unzip the zipped csv file and save it locally.
#
# This script takes two arguments: the path to the input file , and a path where to write the file to. 
#
# Usage: Rscript src/data_loading.R "ftp://webftp.vancouver.ca/opendata/csv/crime_csv_all_years.zip"   "data"
#

suppressPackageStartupMessages(library(tidyverse))

# read in command line arguments
args <- commandArgs(trailingOnly = TRUE)
file_url <- args[1]
file_save <- args[2]

# define main function
main <- function(){
  

# read in data
download.file(file_url, "crime_csv_all_years.zip") # download file
unzip("crime_csv_all_years.zip", exdir = file_save) # unzip files
file.remove("crime_csv_all_years.zip") # tidy up by removing the zip file
}

# call main function
main()