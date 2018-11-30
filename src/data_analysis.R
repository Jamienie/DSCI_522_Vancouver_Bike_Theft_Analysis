# data_analysis.R
# November 2018

# This script that reads the data from the second script, 
# performs t-test analysis and writes these statistical summaries
# to file in CSV format. 

# This script takes two arguments: a path/filename pointing to the data, a path/filename where to write the file to and what to call it
#
# Usage: Rscript data_analysis.R "../results/data_all_years_bicycle.csv"  "../results/analysis_summary.csv"

library(tidyverse)
library(broom)

# read in command line arguments
args <- commandArgs(trailingOnly = TRUE)
file_input <- args[1]
summary_output <- args[2]

# reading data
my_data <- read.csv(file_input)

# Defining main function
main <- function(){

data_avg <- my_data %>% select(n,summer)
  
analysis <- broom::tidy(t.test(n ~ summer, data=data_avg, alternative="less", var.equal = TRUE))

write.csv(analysis,summary_output)
}
# Call main function
main()
