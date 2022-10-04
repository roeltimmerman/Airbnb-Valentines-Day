### ANALYSIS ###
## T.TEST FOR PRICE AND VALENTINESDAY ##
# Price in total #
complete_data$price <- as.numeric(as.factor(complete_data$price))
t_test_price <- t.test(price ~ valentinesday, complete_data)
t_test_price

library(dplyr)
group_by(complete_data, complete_data$valentinesday) %>% 
    summarise(
        count = n(),
        mean = mean(complete_data$price, na.rm = TRUE),
        sd =  sd(complete_data$price, na.rm = TRUE)
    )

install.packages('ggpubr')
library(ggpubr)
ggboxplot(complete_data, x="valentinesday", y="price",
          color="valentinesday", palette = c("#00AFBB", "#E7B800"),
          ylab= "Price", xlab="Valentinesday")

# Price per city #
lapply(split(complete_data, factor(complete_data$city)), function(x)t.test(data=x, price ~ valentinesday, paired=FALSE)) 

ggplot(complete_data, aes(x=valentinesday, y=price, fill=city)) + 
    geom_boxplot() +
    facet_wrap(~valentinesday, scale="free")

## LOGISTIC REGRESSION FOR BOOKINGS AND VALENTINESDAY ##
# Bookings in total #
glm1 <- glm(booked ~ valentinesday, complete_data, family = binomial)
exp(glm1$coefficients)

# Bookings per city #
glm1_per_city <- lapply(split(complete_data, factor(complete_data$city)), function(x)glm(data=x, booked ~ valentinesday))
glm1_per_city
exp(glm1_per_city$coefficents)