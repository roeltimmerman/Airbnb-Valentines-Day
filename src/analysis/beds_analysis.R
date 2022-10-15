###################
## BEDS ANALYSIS ##
###################

# Load libraries #
library(tidyverse)
library(ggplot2)
library(ggpubr)
library(stargazer)

## INPUT ##
complete_data_booked <- read.csv("../../gen/data-preparation/temp/complete_data_booked.csv")
complete_data_booked_mad <- read.csv("../../gen/data-preparation/temp/complete_data_booked_mad.csv")
complete_data_booked_par <- read.csv("../../gen/data-preparation/temp/complete_data_booked_par.csv")
complete_data_booked_rom <- read.csv("../../gen/data-preparation/temp/complete_data_booked_rom.csv")

## TRANSFORMATION ##
# Descriptive statistics #
# Descriptives number of beds dummy
summary(complete_data_booked$beds_dummy)
mean_beds <- mean(complete_data_booked$beds_dummy)
save(mean_beds, file = 'meanbeds.RData')

data_beds <- table(complete_data_booked$valentinesday, complete_data_booked$beds_dummy)
# Visualization beds #
histogram_beds <- hist(complete_data_booked$beds, xlab = 'number of beds')

beds_booked_valentinesday <- ggboxplot(complete_data_booked, 
                                       x="valentinesday", y="beds", 
                                       color="valentinesday", palette = c("#00AFBB", "#E7B800"), 
                                       ylab= "Beds", xlab="Valentinesday")

# Assumptions (normality) #
set.seed(5000)
complete_data_booked_sample <- rnorm(5000)
shapiro.test(complete_data_booked_sample)

# Logistic regression for beds
# Beds in total
glm2 <- glm(beds_dummy ~ valentinesday, data = complete_data_booked)
exp(glm2$coefficients)

# Model fit of total 
glm2_chisq <- glm2$null.deviance-glm2$deviance 
glm2_chisqdf <- glm2$df.null-glm2$df.residual 
1-pchisq(glm2_chisq,glm2_chisqdf) 

# Logistic regression per city 
glm2_per_city <- lapply(split(complete_data_booked, factor(complete_data_booked$city)), function(x)glm(data=x, beds_dummy ~ valentinesday))
lapply(glm2_per_city, function(x) 
exp(x$coefficients))
glm2_m1 <- glm(beds_dummy ~ valentinesday, data = complete_data_booked_mad)
exp(glm2_m1$coefficients)
glm2_m2 <- glm(beds_dummy ~ valentinesday, data = complete_data_booked_par)
exp(glm2_m2$coefficients)
glm2_m3 <- glm(beds_dummy ~ valentinesday, data = complete_data_booked_rom)
exp(glm2_m3$coefficients)

## Output ##
pdf(file="../../gen/analysis/output/histogram_beds.pdf")
dev.off()
ggsave(plot = beds_booked_valentinesday, filename = "../../gen/analysis/output/beds_booked_valentinesday.pdf")
stargazer(glm2_m1, glm2_m2, glm2_m3, apply.coef=exp, apply.se = exp, type="html", title="Effect of Valentine's Day on number of beds of Airbnb listings per city",
          dep.var.caption = "One or two beds",
          dep.var.labels="",
          model.numbers = FALSE,
          column.labels = c('Madrid', 'Paris', 'Rome'),
          covariate.labels="Valentine's Day", out='../../gen/analysis/output/model_beds_city.html')
stargazer(glm2, apply.coef=exp, apply.se = exp, type="html", title="Effect of Valentine's Day on number of beds of Airbnb listings",
          dep.var.caption = "One or two beds",
          dep.var.labels="",
          column.labels = 'Total',
          covariate.labels="Valentine's Day", out='../../gen/analysis/output/model_beds.html')