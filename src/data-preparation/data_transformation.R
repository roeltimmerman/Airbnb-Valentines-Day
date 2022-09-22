## DATA TRANSFORMATION ##
# DOWNLOAD PACKAGES #
install.packages('tidyverse')
install.packages('dplyr')
install.packages('ggplot2')
install.packages('readr')
install.packages('stringr')

# LOAD PACKAGES #
library('tidyverse')
library('dplyr')
library('ggplot2')
library('readr')
library('stringr')

# FILTER VARIABLES NEEDED #
list_ams_filtered <- c('id', 'host_id', 'name', 'host_since', 'hosts_location', 'host_neighbourhood', 'neighbourhood_cleansed', 'room_type', 'property_type', 'minimum_nights', 'beds', 'price')
list_ams_filtered <- list_ams[,which(colnames(list_ams)%in%list_ams_filtered)]

reviews_ams_filterd <-c('date', 'reviewer_id', 'reviewer_name', 'comments')
reviews_ams_filtered <- reviews_ams[,which(colnames(reviews_ams)%in%reviews_ams_filterd)]

calendar_ams_filtered <- c('listing_id', 'date','available','price', 'minimum_nights')
calendar_ams_filtered <- calendar_ams[,which(colnames(calendar_ams)%in%calendar_ams_filtered)]






# RENAMING VARIABLES # 
rename(data_frame_ams, #willen we namen veranderen van variabelen? 
       )

# CHECKING 


