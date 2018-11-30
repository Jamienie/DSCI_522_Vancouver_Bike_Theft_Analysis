# data_viz_final.R
# November 2018

# This script reads the data from the csv outputted from the
# second script and creates a boxplot visualization of the
# two categorical variables summer and not summer.

# This script takes two arguments: a path/filename pointing to the 
# data, a path/file name where to write the figure to and what to 
# call it 

#Usage: Rscript data_viz_final.R "../results/data_all_years_bicycle.csv" "../results/figures/bike_boxplot.png"

library(tidyverse)
library(ggplot2)

# read in command line arguments
args <- commandArgs(trailingOnly = TRUE)
file_input <- args[1]
img_output <- args[2]

# Reads in csv file
data_b <- read.csv(file_input)


# Defining main function
main <- function(){

alpha <- 0.05  

summer_data <- data_b %>% mutate(Summer=ifelse(MONTH %in% c(6,7,8),"Yes","No"))
x_map <- c(Yes=1,No=0)
summer_data <- mutate(summer_data,num_x=x_map[Summer])

viz <- summer_data %>%
  group_by(Summer,num_x)%>%
  summarise(mean=mean(n),
            total=length(n),
            se=sd(n)/sqrt(total))%>%
  ggplot(aes(x=num_x))+
  geom_violin(data=summer_data,mapping=aes(group=Summer,y=n))+
  geom_jitter(data=summer_data,mapping=aes(group=Summer,y=n),alpha=0.6,width=0.2,size=0.7)+
  geom_point(aes(y=mean),color="red")+
  geom_errorbar(aes(ymin=mean+qnorm(alpha/2)*se,
                    ymax=mean-qnorm(alpha/2)*se,
                    color="red",
                    width=0.1))+
  labs(x="Is it summer in Vancouver?",
       y="Number of bikes stolen per month")+
  scale_x_continuous(breaks=enframe(x_map)$value,
                     labels=enframe(x_map)$name)+
  theme_bw()+
  theme(legend.position = "none")

#%>%
#  mutate(SUMMER=ifelse(MONTH %in% c(6,7,8),"Yes","No")) %>%
#  ggplot(aes(SUMMER,n))+
#  geom_boxplot()+
#    ylab("Number of bikes thefts reported per month")
ggsave(img_output, viz, device = "png")

}

#Calling main function
main()