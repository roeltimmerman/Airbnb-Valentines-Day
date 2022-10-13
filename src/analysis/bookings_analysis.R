#######################
## BOOKINGS ANALYSIS ##
#######################

# Load libraries #
library(tidyverse)
library(ggplot2)
library(ggpubr)
library(stargazer)

## INPUT ##
complete_data <- read.csv("../../gen/data-preparation/temp/complete_data.csv") 
complete_data_mad <- read.csv("../../gen/data-preparation/temp/complete_data_booked_mad.csv")
complete_data_par <- read.csv("../../gen/data-preparation/temp/complete_data_booked_par.csv")
complete_data_rom <- read.csv("../../gen/data-preparation/temp/complete_data_booked_rom.csv")

## TRANSFORMATION ##
summary(complete_data$booked)
mean_booked <- mean(complete_data$booked)
save(mean_booked, file = 'meanbooked.RData')

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
summary(glm1)
exp(glm1$coefficients)
histogram_total_bookings <- hist(complete_data$booked, xlab = 'booked') 

# Model fit of total bookings 
glm1_chisq <- glm1$null.deviance-glm1$deviance 
glm1_chisqdf <- glm1$df.null-glm1$df.residual 
1-pchisq(glm1_chisq,glm1_chisqdf) 

# Bookings per city 
glm1_per_city <- lapply(split(complete_data, factor(complete_data$city)), function(x)glm(data=x, booked ~ valentinesday))
lapply(glm1_per_city, function(x) 
exp(x$coefficients))
# Deze waardes kloppen niet...
glm1_m1 <- glm(booked ~ valentinesday, complete_data_mad, family = binomial)
exp(glm1_m1$coefficients)
glm1_m2 <- glm(booked ~ valentinesday, complete_data_par, family = binomial)
exp(glm1_m2$coefficients)
glm1_m3 <- glm(booked ~ valentinesday, complete_data_rom, family = binomial)
exp(glm1_m3$coefficients)

## OUTPUT ##
pdf(file="../../gen/analysis/output/histogram_booked.pdf")
dev.off()
pdf(file="../../gen/analysis/output/histogram_total_bookings.pdf")
dev.off()
stargazer(glm1_m1, glm1_m2, glm1_m3, apply.coef=exp, apply.se = exp, type="html", title="Effect of Valentine's Day on number of bookings of Airbnb listings",
          dep.var.caption = "Number of bookings",
          dep.var.labels="",
          model.numbers = FALSE,
          column.labels = c('Madrid', 'Paris', 'Rome'),
          covariate.labels="Valentine's Day", out='../../gen/analysis/output/model_bookings_city.html')
stargazer(glm1, apply.coef=exp, apply.se = exp, type="html", title="Effect of Valentine's Day on number of bookings of Airbnb listings",
          dep.var.caption = "Number of bookings",
          dep.var.labels="",
          column.labels = 'Total',
          covariate.labels="Valentine's Day", out='../../gen/analysis/output/model_bookings.html')