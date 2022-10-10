#### Analysis 2 - Logistic regression for bookings and valentinesday 

# Library #
library(tidyverse)
library(ggplot2)
library(ggpubr)

## INPUT ##
complete_data <- read.csv("../../gen/data-preparation/temp/complete_data.csv") 

## TRANSFORMATION ##
summary(complete_data$booked)
table(complete_data$booked)
histogram_booked <- hist(complete_data$booked, xlab = 'booked')

table(complete_data$date == "2022-02-14")
set.seed(1)
sample(complete_data$date, 1)
table(complete_data$date == "2022-02-09")

# Assumptions (normality) #
set.seed(5000)
complete_data_sample <- rnorm(5000)
shapiro.test(complete_data_sample)

# Logistic regression bookings #
# Total bookings 
glm1 <- glm(booked ~ valentinesday, complete_data, family = binomial) 
glm1
exp(glm1$coefficients)
histogram_total_bookings <- hist(complete_data$booked, xlab = 'booked') 
# Model fit of total bookings 
glm1_chisq <- glm1$null.deviance-glm1$deviance 
glm1_chisqdf <- glm1$df.null-glm1$df.residual 
1-pchisq(glm1_chisq,glm1_chisqdf) 
# Bookings per city 
glm1_per_city <- lapply(split(complete_data, factor(complete_data$city)), function(x)glm(data=x, booked ~ valentinesday))
glm1_per_city
lapply(glm1_per_city, function(x) 
exp(x$coefficients))

## OUTPUT ##
pdf(file="../../gen/analysis/output/histogram_booked.pdf")
dev.off()
pdf(file="../../gen/analysis/output/histogram_total_bookings.pdf")
dev.off()




