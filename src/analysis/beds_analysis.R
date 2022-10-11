########################
### BEDS ANALYSIS ###
########################

## Library ##
library(tidyverse)
library(ggplot2)
library(ggpubr)

## INPUT ##
complete_data <- read.csv("../../gen/data-preparation/temp/complete_data.csv") 

## TRANSFORMATION ##
complete_data_booked <- complete_data %>% 
    filter(complete_data$booked == 1)
complete_data_booked$beds_dummy <- ifelse(complete_data_booked$beds <= 2, 1, 0)

# Descriptive statistics #
# Descriptives beds dummy
summary(complete_data_booked$beds_dummy)
mean_beds <- mean(complete_data_booked$beds_dummy)
save(mean_beds, file = 'meanbeds.RData')

data_beds <- table(complete_data_booked$valentinesday, complete_data_booked$beds_dummy)
data_beds
# Visualization beds
histogram_beds <- hist(complete_data_booked$beds, xlab = 'number of beds')

beds_booked_valentinesday <- ggboxplot(complete_data_booked, 
                                       x="valentinesday", y="beds", 
                                       color="valentinesday", palette = c("#00AFBB", "#E7B800"), 
                                       ylab= "Beds", xlab="Valentinesday")
beds_booked_valentinesday

# Assumptions (normality) #
set.seed(5000)
complete_data_booked_sample <- rnorm(5000)
shapiro.test(complete_data_booked_sample)

# Logistic regression for beds #
# Beds in total
glm2 <- glm(beds_dummy ~ valentinesday, data = complete_data_booked)
glm2
exp(glm2$coefficients)
# Model fit of total 
glm2_chisq <- glm2$null.deviance-glm2$deviance 
glm2_chisqdf <- glm2$df.null-glm2$df.residual 
1-pchisq(glm2_chisq,glm2_chisqdf) 
# Logistic regression per city 
glm2_per_city <- lapply(split(complete_data_booked, factor(complete_data_booked$city)), function(x)glm(data=x, beds_dummy ~ valentinesday))
glm2_per_city

lapply(glm2_per_city, function(x) 
exp(x$coefficients))

## Output ##
#write.csv(data_beds,filename = "../../gen/analysis/output/beds_booked.csv", row.names = FALSE)
pdf(file="../../gen/analysis/output/histogram_beds.pdf")
dev.off()
ggsave(plot = beds_booked_valentinesday, filename = "../../gen/analysis/output/beds_booked_valentinesday.pdf")





