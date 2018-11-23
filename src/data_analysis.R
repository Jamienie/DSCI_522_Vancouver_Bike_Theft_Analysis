# data_analysis.R
# November 2018

# This script that reads the data from the second script, performs t-test analysis and writes these statistical summaries
# to file in CSV format. 

# This script takes two arguments: a path/filename pointing to the data, a path/filename where to write the file to and what to call it
#
# Usage: Rscript data_analysis.R "../data/data_all_years_bicycle.csv"  "../results/analysis_summary.csv" 
#
# define main function

library(tidyverse)

# read in command line arguments
args <- commandArgs(trailingOnly = TRUE)
file_input <- args[1]
summary_output <- args[2]

# read the clean data csv file into r
data <- read.csv(file_input) 

main <- function(){
  
  data_all_years_bicycle_avg <- data %>% 
    mutate(summer = ifelse (MONTH %in% c(6,7,8), "yes","no")) %>%
    group_by(summer, YEAR) %>%
    summarise(count = n()) %>%
    mutate(avg_count = round(count/15,2))
  
  test_summer <- data_all_years_bicycle_avg %>% subset(summer == "yes", select=avg_count)
  test_summer <- as.vector(test_summer$avg_count)
  
  test_not_summer <- data_all_years_bicycle_avg %>% subset(summer == "no", select=avg_count)
  test_not_summer <- as.vector(test_not_summer$avg_count)
  
  analysis <- broom::tidy(t.test(test_summer,test_not_summer, alternative="greater", var.equal = FALSE))
  print(analysis)
  write.csv(analysis, summary_output)
}


# call main function
main()
