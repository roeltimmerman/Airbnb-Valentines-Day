#### Analysis 1 t-test for price and valentinesday 
## Library 
library(ggplot2)
library(tidyverse)
library(ggpubr)

# Create directory #
dir.create('../../gen/analysis/output', recursive = T)

## Input ##
complete_data <- read.csv("../../gen/temp/complete_data.csv") 

# Data transformation for analysis 1 
complete_data$price <- as.numeric(as.factor(complete_data$price)) 

# Descriptive statistics 
summary(complete_data$price)
table(complete_data$price)
hist_data_price <- hist(complete_data$price, xlab = 'price') 

summary(complete_data$valentinesday)
valentinesday_yes_no <- table(complete_data$valentinesday)

# Assumptions (normality and outliers)
set.seed(5000)
complete_data_sample <- rnorm(4999)
shapiro.test(complete_data_sample)

ggboxplot(complete_data, x="valentinesday", y="price",
          color="valentinesday", palette = c("#00AFBB", "#E7B800"),
          ylab= "Price", xlab="Valentinesday")

# Price in total 
t_test_price <- t.test(price ~ valentinesday, complete_data) 
t_test_price 

# Histogram price division
histogram_prices <- hist(complete_data$price, xlab = 'price in €') 

# Price per city # 
lapply(split(complete_data, factor(complete_data$city)), function(x)t.test(data=x, price ~ valentinesday, paired=FALSE))

# Plot for different cities 
boxplot_price_per_city <- ggplot(complete_data, aes(x=valentinesday, y=price, fill=city)) + 
    geom_boxplot() +
    facet_wrap(~valentinesday, scale="free") +
    theme(axis.text.x=element_blank(),
          axis.ticks.x=element_blank())

## Output ##
valentinesday_yes_no
price_valentinesday_boxplot
histogram_prices
boxplot_price_per_city

write.csv(valentinesday_yes_no, '../../gen/analysis/output/valentinesday_yes_no')

