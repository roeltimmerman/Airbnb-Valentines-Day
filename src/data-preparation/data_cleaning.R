###################
## DATA CLEANING ##
###################

# Creating gen/temp directory #
dir.create('../../gen/data-preparation/temp', recursive = T)

# load libraries #
library(tidyverse)
library(dplyr)
library(ggplot2)
library(readr)
library(stringr)

## INPUT ##
# Paris data
list_par <- read.csv(gzfile('../../data/listings-paris.csv.gz')) 
calendar_par <- read.csv(gzfile('../../data/calendar-paris.csv.gz'))
# Rome data
list_rom <- read.csv(gzfile('../../data/listings-rome.csv.gz')) 
calendar_rom <- read.csv(gzfile('../../data/calendar-rome.csv.gz'))
# Madrid data
list_mad <- read.csv(gzfile('../../data/listings-madrid.csv.gz')) 
calendar_mad <- read.csv(gzfile('../../data/calendar-madrid.csv.gz'))


## TRANSFORMATION ##
# Rome
list_rom_filtered <- c('id', 'host_id', 'hosts_location', 'neighbourhood', 'property_type', 'room_type', 'accomodates', 'minimum_nights', 'beds', 'price')
list_rom_filtered <- list_rom[,which(colnames(list_rom)%in%list_rom_filtered)]
calendar_rom_filtered <- c('listing_id', 'date','available','price', 'minimum_nights')
calendar_rom_filtered <- calendar_rom[,which(colnames(calendar_rom)%in%calendar_rom_filtered)]

## Cleaning the listings file ##
# Change name column id to listing_id # 
list_rom_filtered <- list_rom_filtered %>% 
    rename(listing_id = id)

## Cleaning the calender file ##
# Renaming variables #  
calendar_rom_filtered <- calendar_rom_filtered %>% 
    rename(booked = available, 
           date_old = date)
# Booked as a binary variable 
calendar_rom_filtered$booked <- ifelse(calendar_rom_filtered$booked=='f',1,0)
# Change type of date to a date 
calendar_rom_filtered <- calendar_rom_filtered %>% 
    group_by(date_old) %>% 
    mutate(date = as.Date(date_old))
calendar_rom_filtered2 <- c('listing_id', 'date', 'booked', 'price', 'minimum_nights')
calendar_rom_filtered2 <- calendar_rom_filtered[,which(colnames(calendar_rom_filtered)%in%calendar_rom_filtered2)]
# Filter for time period (two-weeks before & after Valentine's day)
calendar_rom_filtered3 <- calendar_rom_filtered2[calendar_rom_filtered2$date >= "2022-02-01" &
                                                     calendar_rom_filtered2$date <= "2022-02-28", ]
# Add Valentine's day dummy variable 
calendar_rom_filtered3$valentinesday <- ifelse(calendar_rom_filtered3$date=="2022-02-14",1,0)
table(calendar_rom_filtered3$valentinesday)

# Inner join datasets #
rome_data <- inner_join(calendar_rom_filtered3, list_rom_filtered, by=c('listing_id','price', 'minimum_nights'))

# Add city variable #
rome_data$city <- "Rome"

# Add number of listings variable #
rome_data$n_listings <- nrow(list_rom)

# Madrid
list_mad_filtered <- c('id', 'host_id', 'hosts_location', 'neighbourhood', 'property_type', 'room_type', 'accomodates', 'minimum_nights', 'beds', 'price')
list_mad_filtered <- list_mad[,which(colnames(list_mad)%in%list_mad_filtered)]
calendar_mad_filtered <- c('listing_id', 'date','available','price', 'minimum_nights')
calendar_mad_filtered <- calendar_mad[,which(colnames(calendar_mad)%in%calendar_mad_filtered)]

# Cleaning the listings file #
# Change name column id to listing_id #
list_mad_filtered <- list_mad_filtered %>% 
    rename(listing_id = id)

# Cleaning the calender file #
# Renaming variables #
calendar_mad_filtered <- calendar_mad_filtered %>% 
    rename(booked = available, 
           date_old = date)
# Booked as a binary variable 
calendar_mad_filtered$booked <- ifelse(calendar_mad_filtered$booked=='f',1,0)
# Change type of date to a date 
calendar_mad_filtered <- calendar_mad_filtered %>% 
    group_by(date_old) %>% 
    mutate(date = as.Date(date_old))
calendar_mad_filtered2 <- c('listing_id', 'date', 'booked', 'price', 'minimum_nights')
calendar_mad_filtered2 <- calendar_mad_filtered[,which(colnames(calendar_mad_filtered)%in%calendar_mad_filtered2)]
# Filter for time period (two-weeks before & after Valentine's day)
calendar_mad_filtered3 <- calendar_mad_filtered2[calendar_mad_filtered2$date >= "2022-02-01" &
                                                     calendar_mad_filtered2$date <= "2022-02-28", ]
# Add Valentine's day dummy variable 
calendar_mad_filtered3$valentinesday <- ifelse(calendar_mad_filtered3$date=="2022-02-14",1,0)
table(calendar_mad_filtered3$valentinesday)

# Inner-join datasets #
madrid_data <- inner_join(calendar_mad_filtered3, list_mad_filtered, by=c('listing_id','price', 'minimum_nights'))

# Add city variable #
madrid_data$city <- "Madrid"

# Add number of listings variable #
madrid_data$n_listings <- nrow(list_mad)

# Paris
list_par_filtered <- c('id', 'host_id', 'hosts_location', 'neighbourhood', 'property_type', 'room_type', 'accomodates', 'minimum_nights', 'beds', 'price')
list_par_filtered <- list_par[,which(colnames(list_par)%in%list_par_filtered)]
calendar_par_filtered <- c('listing_id', 'date','available','price', 'minimum_nights')
calendar_par_filtered <- calendar_par[,which(colnames(calendar_par)%in%calendar_par_filtered)]

# Cleaning the listings file #
# Change name column id to listing_id #
list_par_filtered <- list_par_filtered %>% 
    rename(listing_id = id)

# Cleaning the calender file #
# Renaming variables #
calendar_par_filtered <- calendar_par_filtered %>% 
    rename(booked = available, 
           date_old = date)
# Booked as a binary variable
calendar_par_filtered$booked <- ifelse(calendar_par_filtered$booked=='f',1,0)
# Change type of date to a date 
calendar_par_filtered <- calendar_par_filtered %>% 
    group_by(date_old) %>% 
    mutate(date = as.Date(date_old))
calendar_par_filtered2 <- c('listing_id', 'date', 'booked', 'price', 'minimum_nights')
calendar_par_filtered2 <- calendar_par_filtered[,which(colnames(calendar_par_filtered)%in%calendar_par_filtered2)]
# Filter for time period (two-weeks before & after Valentine's day)
calendar_par_filtered3 <- calendar_par_filtered2[calendar_par_filtered2$date >= "2022-02-01" &
                                                     calendar_par_filtered2$date <= "2022-02-28", ]
# Add Valentine's day dummy variable 
calendar_par_filtered3$valentinesday <- ifelse(calendar_par_filtered3$date=="2022-02-14",1,0)
table(calendar_par_filtered3$valentinesday)

# Inner-join the datasets #
paris_data <- inner_join(calendar_par_filtered3, list_par_filtered, by=c('listing_id','price', 'minimum_nights'))

# Add city variable #
paris_data$city <- "Paris"

# Add number of listings variable #
paris_data$n_listings <- nrow(list_par)

# Merge the three city files into one with NA's still included #
complete_data_withNA <- bind_rows(madrid_data, paris_data, rome_data)
complete_data_withNA

# Remove missings #
complete_data <- na.omit(complete_data_withNA)

## TRANSFORMATION of complete_data ##
# Price as numeric #
complete_data$price <- as.numeric(as.factor(complete_data$price)) 
# Beds as dummy #
complete_data_booked <- complete_data %>% 
    filter(complete_data$booked == 1)
complete_data_booked$beds_dummy <- ifelse(complete_data_booked$beds <= 2, 1, 0)
# Per city #
# Madrid #
complete_data_booked_mad <- complete_data_booked %>%
    filter(complete_data_booked$city == "Madrid")
# Paris #
complete_data_booked_par <- complete_data_booked %>%
    filter(complete_data_booked$city == "Paris")
# Rome #
complete_data_booked_rom <- complete_data_booked %>%
    filter(complete_data_booked$city == "Rome")

## OUTPUT ## 
write.csv(complete_data, "../../gen/data-preparation/temp/complete_data.csv")
write.csv(complete_data_booked, "../../gen/data-preparation/temp/complete_data_booked.csv")
write.csv(complete_data_booked_mad, "../../gen/data-preparation/temp/complete_data_booked_mad.csv")
write.csv(complete_data_booked_par, "../../gen/data-preparation/temp/complete_data_booked_par.csv")
write.csv(complete_data_booked_rom, "../../gen/data-preparation/temp/complete_data_booked_rom.csv")