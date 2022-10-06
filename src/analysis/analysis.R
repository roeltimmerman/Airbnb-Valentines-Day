#### Analysis 1 t-test for price and valentinesday 
## Library 
library(ggplot2)
library(tidyverse)
library(ggpubr)

## Input ##
complete_data <- read.csv("../../gen/temp/complete_data.csv") 

# Data transformation for analysis 1 
complete_data$price <- as.numeric(as.factor(complete_data$price)) 

# Assumptions (outliers)
ggboxplot(complete_data, x="valentinesday", y="price",
          color="valentinesday", palette = c("#00AFBB", "#E7B800"),
          ylab= "Price", xlab="Valentinesday")

# Price in total 
t_test_price <- t.test(price ~ valentinesday, complete_data) 
t_test_price 

# Plot for total 
ggboxplot(complete_data, x="valentinesday", y="price",
          color="valentinesday", palette = c("#00AFBB", "#E7B800"),
          ylab= "Price", xlab="Valentinesday")

hist(complete_data$price, xlab = 'price') 

# Price per city # 
lapply(split(complete_data, factor(complete_data$city)), function(x)t.test(data=x, price ~ valentinesday, paired=FALSE))

# Plot for different cities 
ggplot(complete_data, aes(x=valentinesday, y=price, fill=city)) + 
    geom_boxplot() +
    facet_wrap(~valentinesday, scale="free")

