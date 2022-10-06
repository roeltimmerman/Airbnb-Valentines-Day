## Beds analysis ##
library(scales)
library(ggplot2)
View(complete_data)

# LOGISTIC REGRESSION FOR BEDS #
lm_beds <- lm(beds ~ valentinesday, data = complete_data)
summary(lm_beds)

# Create dummy for beds #


# MAKE HISTOGRAM #
# For Valentines #
complete_data_valentines_booked <- complete_data %>% 
    filter(valentinesday == 1, booked == 1) 


    

ggplot(complete_data_valentines_booked, aes(x = beds) +  
    geom_bar(aes(y = (..count..)/sum(..count..))) + 
    scale_y_continuous(labels=percent)
    
    
# For Normal days #
complete_data_normally_booked <- complete_data %>% 
    filter(valentinesday == 0, booked == 1)

ggplot(complete_data_normally_booked, aes(x = beds)) +  
    geom_bar(aes(y = (..count..)/sum(..count..))) + 
    scale_y_continuous(labels=percent)



