### ANALYSIS ###

# add to other documents
install.packages('ggpubr')
library(ggpubr)
library(readr)

# Input
complete_data <- read.csv("../../gen/data-preparation/temp/complete_data.csv")


## T.TEST FOR PRICE AND VALENTINESDAY ##
# Assumptions for T-test
#Outliers-> no outliers in boxplot. 
#Normality no necessary as there are no outliers and sample size>25 per group   
    #(https://eje.bioscientifica.com/view/journals/eje/182/2/EJE-19-0922.xml)

# Price in total # --> not significant
complete_data$price <- as.numeric(as.factor(complete_data$price))
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


-------------------------


## LOGISTIC REGRESSION FOR BOOKINGS AND VALENTINESDAY ##
# Assumptions logistic regression

    
# Bookings in total #
glm1 <- glm(booked ~ valentinesday, complete_data, family = binomial)
exp(glm1$coefficients)

# Bookings per city #
glm1_per_city <- lapply(split(complete_data, factor(complete_data$city)), function(x)glm(data=x, booked ~ valentinesday))
glm1_per_city
exp(glm1_per_city$coefficents)