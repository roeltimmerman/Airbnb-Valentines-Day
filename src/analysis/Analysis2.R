#### Analysis 2 Logistic regression for bookings and valentinesday 
### Library
library(tidyverse)
library(ggplot2)
library(ggpubr)

## Input 
complete_data <- read.csv("../../gen/temp/complete_data.csv") 

# Assumptions (outliers)


# Total bookings 
glm1 <- glm(booked ~ valentinesday, complete_data, family = binomial) 
exp(glm1$coefficients)
hist(complete_data$booked, xlab = 'booked') 

# Model fit of total bookings 
glm1_chisq <- glm1$null.deviance-glm1$deviance 
glm1_chisqdf <- glm1$df.null-glm1$df.residual 
1-pchisq(glm1_chisq,glm1_chisqdf) 

# Bookings per city # 
glm1_per_city <- lapply(split(complete_data, factor(complete_data$city)), function(x)glm(data=x, booked ~ valentinesday))
glm1_per_city
exp(glm1_per_city$coefficents)
lapply(glm1_per_city, function(x) exp(x$coefficients))








