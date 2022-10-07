#### Analysis 3 - Logistic regression for number of beds
### Library
library(tidyverse)
library(ggplot2)

## Input ##
complete_data <- read.csv("../../gen/data-preparation/temp/complete_data.csv") 

# Data transformation for analysis 3
complete_data_booked <- complete_data %>% 
    filter(complete_data$booked == 1)
complete_data_booked$beds_dummy <- ifelse(complete_data$beds <= 2, 1, 0)

# Descriptive statistics
summary(complete_data_booked$beds_dummy)
data_beds <- table(complete_data_booked$valentinesday, complete_data_booked$beds_dummy)
data_beds
## HIER MOET NOG DE BARPLOT 

# Assumptions (normality)
set.seed(5000)
complete_data_booked_sample <- rnorm(5000)
shapiro.test(complete_data_sample)

# Logistic regression total 
glm2 <- glm(beds_dummy ~ valentinesday, data = complete_data_booked)
glm2
exp(glm2$coefficients)

# Model fit of total bookings 
glm2_chisq <- glm2$null.deviance-glm2$deviance 
glm2_chisqdf <- glm2$df.null-glm2$df.residual 
1-pchisq(glm2_chisq,glm2_chisqdf) 

# Logistic regression per city 
glm2_per_city <- lapply(split(complete_data_booked, factor(complete_data_booked$city)), function(x)glm(data=x, beds_dummy ~ valentinesday))
glm2_per_city

lapply(glm2_per_city, function(x) 
exp(x$coefficients))

## Output ##
write.csv(data_beds,filename = "../../gen/analysis/output/beds_booked.csv", row.names = FALSE)
ggsave(plot = ..., filename = "../../gen/analysis/output/beds_valentinesday_barplot.pdf")
dev.off()




