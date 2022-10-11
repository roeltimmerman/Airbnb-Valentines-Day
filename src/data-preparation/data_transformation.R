#########################
## DATA TRANSFORMATION ##
#########################

# load libraries #
library(tidyverse)
library(dplyr)

## INPUT ## 
complete_data <- read.csv("../../gen/data-preparation/temp/complete_data.csv") 

## TRANSFORMATION ##
# Price as numeric #
complete_data$price <- as.numeric(as.factor(complete_data$price)) 
# Beds as dummy #
complete_data_booked <- complete_data %>% 
    filter(complete_data$booked == 1)
complete_data_booked$beds_dummy <- ifelse(complete_data_booked$beds <= 2, 1, 0)

## OUTPUT ## 
write.csv(complete_data, "../../gen/data-preparation/temp/complete_data.csv")
write.csv(complete_data_booked, "../../gen/data-preparation/temp/complete_data_booked.csv")
