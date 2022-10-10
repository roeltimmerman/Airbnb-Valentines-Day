########################
### PRICE ANALYSIS ###
########################

# Create directory #
dir.create('../../gen/analysis/output', recursive = T)

## Library ##
library(ggplot2)
library(tidyverse)
library(ggpubr)

## INPUT ##
complete_data <- read.csv("../../gen/data-preparation/temp/complete_data.csv") 

## TRANSFORMATION ##
complete_data$price <- as.numeric(as.factor(complete_data$price)) 

# Descriptive statistics #
# Descriptives price
summary(complete_data$price)
table(complete_data$price)
histogram_prices <- hist(complete_data$price, xlab = 'price in €') 
histogram_prices
# Descriptives Vday
summary(complete_data$valentinesday)
valentinesday_yes_no <- table(complete_data$valentinesday)
valentinesday_yes_no

# Assumptions (normality and outliers) #
set.seed(5000)
complete_data_sample <- rnorm(5000)
shapiro.test(complete_data_sample)
# Visualization of assumptions
price_valentinesday_boxplot <- ggboxplot(complete_data, x="valentinesday", y="price",
                                         color="valentinesday", palette = c("#00AFBB", "#E7B800"),
                                         ylab= "Price", xlab="Valentinesday")
price_valentinesday_boxplot

# T-test for price #
# Price in total 
t_test_price <- t.test(price ~ valentinesday, complete_data) 
t_test_price 
# Price per city 
lapply(split(complete_data, factor(complete_data$city)), function(x)t.test(data=x, price ~ valentinesday, paired=FALSE))

# Visualization #
# Plot for different cities 
boxplot_price_per_city <- ggplot(complete_data, aes(x=valentinesday, y=price, fill=city)) + 
    geom_boxplot() +
    facet_wrap(~valentinesday, scale="free") +
    theme(axis.text.x=element_blank(),
          axis.ticks.x=element_blank())
boxplot_price_per_city

## OUTPUT ##
#write.csv(valentinesday_yes_no, '../../gen/analysis/output/valentinesday_yes_no.csv')
ggsave(plot = price_valentinesday_boxplot, filename = "../../gen/analysis/output/price_valentinesday_boxplot.pdf")
pdf(file="../../gen/analysis/output/histogram_prices.pdf")
dev.off()
ggsave(plot = boxplot_price_per_city, filename = "../../gen/analysis/output/boxplot_price_per_city.pdf")
