### ANALYSE ###
## ONE-WAY ANOVA ##

as.numeric(as.factor(complete_data$price))



lm_price <- lm(price ~ valentinesday, complete_data)
summary(lm_price)

lm_bookings <- lm(valentinesday ~ )

t.test(price ~ as.factor(valentinesday), complete_data, var.equal = FALSE)


table(complete_data$valentinesday)
complete_data$price <- as.numeric(complete_data$price)



table(complete_data$price)
summary(complete_data)
as.factor(complete_data$valentinesday)
table(complete_data$valentinesday)

summary(complete_data$price)

any(is.na(complete_data$price))

## Goede

#prijs
library(tidyverse)
install.packages('rstatix')
library(rstatix)



# Price in total
complete_data$price <- as.numeric(as.factor(complete_data$price))
t.test(price ~ valentinesday, complete_data)
# Price per city
lapply(split(complete_data, factor(complete_data$city)), function(x)t.test(data=x, price ~ valentinesday, paired=FALSE))


#bookings in total
glm1 <- glm(booked ~ valentinesday, complete_data, family = binomial)
exp(glm1$coefficients)

#bookings per city
glm1_per_city <- lapply(split(complete_data, factor(complete_data$city)), function(x)glm(data=x, booked ~ valentinesday))
glm1_per_city
exp(glm1_per_city$coefficents) 










glm1_per_city <- glm1 %>% 
    group_by(city) 

glm1_per_city



exp <- exp(glm1_per_city$coefficients) %>% 
    group_by(complete_data$city)









#accomodatie

t.test(beds ~ valentinesday, complete_data)


table(complete_data$beds)


any(is.na(complete_data$price))

