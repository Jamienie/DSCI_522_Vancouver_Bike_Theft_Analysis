#Usage: Rscript data_viz_final.R "../data/data_all_years_bicycle.csv" "../results/bike_boxplot.png"

library(tidyverse)
library(ggplot2)

args <- commandArgs(trailingOnly = TRUE)
file_input <- args[1]
img_output <- args[2]

data <- read.csv(file_input)

main <- function(){

summer_data <- data %>%
  mutate(SUMMER=ifelse(MONTH %in% c(6,7,8),"Yes","No")) %>%
  ggplot(aes(SUMMER,n))+
  geom_boxplot()+
    ylab("Number of bikes thefts reported per month")
ggsave(img_output, summer_data, device = "png")

}

main()