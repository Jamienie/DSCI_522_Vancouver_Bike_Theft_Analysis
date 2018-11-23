# data_viz_preliminary.R
# November 2018
# data_all_years_bicycle.csv

# This script generates a figure to be used for data analysis

# # This script takes two arguments: the data file path, and the figure path 
#
# Usage: Rscript data_viz_preliminary.R 
#        "C:/Users/fanfan/Documents/block3/DSCI_522_project/DSCI_522_Vancouver_Bike_Theft_Analysis/data/data_all_years_bicycle.csv"  
#        "C:/Users/fanfan/Documents/block3/DSCI_522_project/DSCI_522_Vancouver_Bike_Theft_Analysis/results/viz_preliminary.png"  
#
# define main function

library(tidyverse)
library(ggplot2)

# read in command line arguments
args <- commandArgs(trailingOnly = TRUE)
file_input <- args[1]
img_output <- args[2]

# read the clean data csv file into r
data_all_years_bicycle <- read.csv(file_input) 

main <- function(){
  
  viz_preliminary <- data_all_years_bicycle %>% ggplot(aes(MONTH, n)) +
            geom_line() +
            facet_wrap(~ YEAR, scales = "free", ncol = 3)
  ggsave(img_output, viz_preliminary, device = "png")
}


# call main function
main()
