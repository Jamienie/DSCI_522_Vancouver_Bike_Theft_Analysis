# data_viz_final.R
# November 2018

# This script reads the data from the csv outputted from the
# second script and creates a boxplot visualization of the
# two categorical variables summer and not summer.

# This script takes two arguments: a path/filename pointing to the 
# data, a path/file name where to write the figure to and what to 
# call it 

#Usage: Rscript data_viz_final.R "../data/data_all_years_bicycle.csv" "../results/bike_boxplot.png"

library(tidyverse)
library(ggplot2)

# read in command line arguments
args <- commandArgs(trailingOnly = TRUE)
file_input <- args[1]
img_output <- args[2]

# Reads in csv file
data <- read.csv(file_input)


# Defining main function
main <- function(){

summer_data <- data %>%
  mutate(SUMMER=ifelse(MONTH %in% c(6,7,8),"Yes","No")) %>%
  ggplot(aes(SUMMER,n))+
  geom_boxplot()+
    ylab("Number of bikes thefts reported per month")
ggsave(img_output, summer_data, device = "png")

}

#Calling main function
main()