## DATA TRANSFORMATION ##
# DOWNLOAD PACKAGES #
install.packages('tidyverse')
install.packages('dplyr')
install.packages('ggplot2')
install.packages('readr')
install.packages('stringr')
install.packages('Sys.Date')

# LOAD PACKAGES #
library('tidyverse')
library('dplyr')
library('ggplot2')
library('readr')
library('stringr')

# FILTER VARIABLES NEEDED #
list_ams_filtered <- c('id', 'host_id', 'name', 'host_since', 'hosts_location', 'host_neighbourhood', 'neighbourhood_cleansed', 'room_type', 'property_type', 'minimum_nights', 'beds', 'price')
list_ams_filtered <- list_ams[,which(colnames(list_ams)%in%list_ams_filtered)]

reviews_ams_filterd <-c('listing_id','date', 'reviewer_id', 'reviewer_name', 'comments')
reviews_ams_filtered <- reviews_ams[,which(colnames(reviews_ams)%in%reviews_ams_filterd)]

calendar_ams_filtered <- c('listing_id', 'date','available','price', 'minimum_nights')
calendar_ams_filtered <- calendar_ams[,which(colnames(calendar_ams)%in%calendar_ams_filtered)]

### Cleaning the calender file ###
# RENAMING VARIABLES # 
calendar_ams_filtered <- calendar_ams_filtered %>% 
    rename(booked = available, 
           date_old = date)

# MAKE BOOKED BINARY VARIABLE # 
calendar_ams_filtered$booked <- ifelse(calendar_ams_filtered$booked=='f',1,0)

# CHANGE TYPE OF DATE TO DATE #
calendar_ams_filtered <- calendar_ams_filtered %>% 
    group_by(date_old) %>% 
    mutate(date = as.Date(date_old))

calendar_ams_filtered2 <- c('listing_id', 'date', 'booked', 'price', 'minimum_nights')
calendar_ams_filtered2 <- calendar_ams_filtered[,which(colnames(calendar_ams_filtered)%in%calendar_ams_filtered2)]

# FILTER FOR SPECIFIC PERIOD #
calendar_ams_filtered3 <- calendar_ams_filtered2[calendar_ams_filtered2$date >= "2022-01-31" &
    calendar_ams_filtered2$date <= "2022-02-28", ]

# MAKING DUMMY VARIABLE FOR VALINTINES DAY #
calendar_ams_filtered3$date_dummy <- ifelse(calendar_ams_filtered3$date=="2022-02-14",1,0)
table(calendar_ams_filtered3$date_dummy)

### Cleaning the review file ###
#For just month of february in 2022#
reviews_ams_filtered1 <- reviews_ams_filtered[reviews_ams_filtered$date >= "2022-01-31" &
                                                     reviews_ams_filtered$date <= "2022-02-28", ]

### Cleaning the listings file ###
# CHANGE COLUMN NAME OF id TO listing_id TO MATCH calendar_ams_filtered3 FILE FOR MERGING #
list_ams_filtered <- list_ams_filtered %>% 
    rename(listing_id = id)

### MERGE THE FILES TO 1 ###
# op listing id? maar staan heel veel listing ids meerdere keren ?
# of eerst mergen/joinen op date en daarna listings toevoegen op listings_id?
