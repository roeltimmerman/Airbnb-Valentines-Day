### ANALYSIS ###
## T.TEST FOR PRICE AND VALENTINESDAY ##
# Price in total #
complete_data$price <- as.numeric(as.factor(complete_data$price))
t_test_price <- t.test(price ~ valentinesday, complete_data)
t_test_price
plot(t.test(price ~ valentinesday, complete_data), x = "price", y = "valentinesday", width = 0.2)

plot(t.test(price ~ valentinesday, complete_data))

library(ggplot2)
ggplot(complete_data,aes(x=valentinesday,y=valentinesday,col=red)+geom_boxplot())

complete_data %>% 
    ggplot(aes(valentinesday, price)) +
    geom_boxplot()

summary(complete_data$valentinesday)
##test
--
library(dplyr)
group_by(complete_data, complete_data$valentinesday) %>% 
    summarise(
        count = n(),
        mean = mean(price, na.rm = TRUE),
        sd =  sd(price, na.rm = TRUE)
    )
    
install.packages('ggpubr')
library(ggpubr)
ggboxplot(complete_data, x=valentinesday, y=price,
          color='valentinesday', palette = c("#00AFBB", "#E7B800"),
          ylab= 'price', xlab='valentinesday)








# Price per city #
lapply(split(complete_data, factor(complete_data$city)), function(x)t.test(data=x, price ~ valentinesday, paired=FALSE))

## LOGISTIC REGRESSION FOR BOOKINGS AND VALENTINESDAY ##
# Bookings in total #
glm1 <- glm(booked ~ valentinesday, complete_data, family = binomial)
exp(glm1$coefficients)

# Bookings per city #
glm1_per_city <- lapply(split(complete_data, factor(complete_data$city)), function(x)glm(data=x, booked ~ valentinesday))
glm1_per_city
exp(glm1_per_city$coefficents) 










