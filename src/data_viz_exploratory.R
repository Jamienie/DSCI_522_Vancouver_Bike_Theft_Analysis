# data_viz_exploratory.R
# November 2018

# This script reads the data from the second script and creates an exploratory visualization that is useful to help the
# reader/consumer understand that dataset. 

# This script takes two arguments: a path/filename pointing to the data, a path/file name where to write the figure to and what to call it 
#
# Usage: Rscript data_viz_exploratory.R "../data/data_all_years_bicycle.csv"  "../results/viz_exploratory.png" 
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
  
  p <- data_all_years_bicycle %>% 
            group_by(YEAR,MONTH) %>%
            summarise(n=n()) %>% # count the numbers of bicycle thefts reported in each month in each year
            ggplot(aes(MONTH, n)) +
            geom_line() +
            ylab("number of bicycle theft") +
            facet_wrap(~ YEAR, scales = "free", ncol = 3)
  ggsave(img_output, p, device = "png")
}


# call main function
main()
