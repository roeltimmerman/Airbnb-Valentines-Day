########################
### DATA PREPARATION ###
########################

# creating gen/temp directory
dir.create('../../gen/data-preparation/temp', recursive = T)

# LOAD PACKAGES #
library(tidyverse)
library(dplyr)
library(ggplot2)
library(readr)
library(stringr)

#Input
# Paris data
list_par <- read.csv(gzfile('../../data/listings-paris.csv.gz')) 
calendar_par <- read.csv(gzfile('../../data/calendar-paris.csv.gz'))

# Rome data
list_rom <- read.csv(gzfile('../../data/listings-rome.csv.gz')) 
calendar_rom <- read.csv(gzfile('../../data/calendar-rome.csv.gz'))

# Madrid data
list_mad <- read.csv(gzfile('../../data/listings-madrid.csv.gz')) 
calendar_mad <- read.csv(gzfile('../../data/calendar-madrid.csv.gz'))

#Transformation
### ROME ###
list_rom_filtered <- c('id', 'host_id', 'hosts_location', 'neighbourhood', 'property_type', 'room_type', 'accomodates', 'minimum_nights', 'beds', 'price')
list_rom_filtered <- list_rom[,which(colnames(list_rom)%in%list_rom_filtered)]

calendar_rom_filtered <- c('listing_id', 'date','available','price', 'minimum_nights')
calendar_rom_filtered <- calendar_rom[,which(colnames(calendar_rom)%in%calendar_rom_filtered)]

### Cleaning the listings file ###
## change name column id to listing_id ##
list_rom_filtered <- list_rom_filtered %>% 
    rename(listing_id = id)

### Cleaning the calender file ###
## renaming variables  ## 
calendar_rom_filtered <- calendar_rom_filtered %>% 
    rename(booked = available, 
           date_old = date)

# make booked a binary variable # 
calendar_rom_filtered$booked <- ifelse(calendar_rom_filtered$booked=='f',1,0)

# change type of date to a date #
calendar_rom_filtered <- calendar_rom_filtered %>% 
    group_by(date_old) %>% 
    mutate(date = as.Date(date_old))

calendar_rom_filtered2 <- c('listing_id', 'date', 'booked', 'price', 'minimum_nights')
calendar_rom_filtered2 <- calendar_rom_filtered[,which(colnames(calendar_rom_filtered)%in%calendar_rom_filtered2)]

# Filter for time period (month february in 2022) #
calendar_rom_filtered3 <- calendar_rom_filtered2[calendar_rom_filtered2$date >= "2022-02-01" &
                                                     calendar_rom_filtered2$date <= "2022-02-28", ]

# Add Valentine's day dummy variable #
calendar_rom_filtered3$valentinesday <- ifelse(calendar_rom_filtered3$date=="2022-02-14",1,0)
table(calendar_rom_filtered3$valentinesday)

#merge / right join
rome_data <- inner_join(calendar_rom_filtered3, list_rom_filtered, by=c('listing_id','price', 'minimum_nights'))
rome_data

#add city variable#
rome_data$city <- "Rome"

#add number of listings variable#
rome_data$n_listings <- nrow(list_rom)

summary(rome_data)

### MADRID ###
#Transformation
list_mad_filtered <- c('id', 'host_id', 'hosts_location', 'neighbourhood', 'property_type', 'room_type', 'accomodates', 'minimum_nights', 'beds', 'price')
list_mad_filtered <- list_mad[,which(colnames(list_mad)%in%list_mad_filtered)]

calendar_mad_filtered <- c('listing_id', 'date','available','price', 'minimum_nights')
calendar_mad_filtered <- calendar_mad[,which(colnames(calendar_mad)%in%calendar_mad_filtered)]

### Cleaning the listings file ###
## change name column id to listing_id ##
list_mad_filtered <- list_mad_filtered %>% 
    rename(listing_id = id)

### Cleaning the calender file ###
## renaming variables  ## 
calendar_mad_filtered <- calendar_mad_filtered %>% 
    rename(booked = available, 
           date_old = date)

# make booked a binary variable # 
calendar_mad_filtered$booked <- ifelse(calendar_mad_filtered$booked=='f',1,0)

# change type of date to a date #
calendar_mad_filtered <- calendar_mad_filtered %>% 
    group_by(date_old) %>% 
    mutate(date = as.Date(date_old))

calendar_mad_filtered2 <- c('listing_id', 'date', 'booked', 'price', 'minimum_nights')
calendar_mad_filtered2 <- calendar_mad_filtered[,which(colnames(calendar_mad_filtered)%in%calendar_mad_filtered2)]

# Filter for time period (month february in 2022) #
calendar_mad_filtered3 <- calendar_mad_filtered2[calendar_mad_filtered2$date >= "2022-02-01" &
                                                     calendar_mad_filtered2$date <= "2022-02-28", ]

# Add Valentine's day dummy variable #
calendar_mad_filtered3$valentinesday <- ifelse(calendar_mad_filtered3$date=="2022-02-14",1,0)
table(calendar_mad_filtered3$valentinesday)

#merge / right join
madrid_data <- inner_join(calendar_mad_filtered3, list_mad_filtered, by=c('listing_id','price', 'minimum_nights'))
madrid_data

#add city variable#
madrid_data$city <- "Madrid"

#add number of listings variable#
madrid_data$n_listings <- nrow(list_mad)

summary(madrid_data)


#extra om te vergelijken voor onszelf of valentines day in verhouding meer booked is#
madrid_data_grouped <- madrid_data %>% group_by(valentinesday) %>% summarise(bookedsum = sum(booked))
madrid_data_grouped

### PARIS ###
#Transformation
list_par_filtered <- c('id', 'host_id', 'hosts_location', 'neighbourhood', 'property_type', 'room_type', 'accomodates', 'minimum_nights', 'beds', 'price')
list_par_filtered <- list_par[,which(colnames(list_par)%in%list_par_filtered)]

calendar_par_filtered <- c('listing_id', 'date','available','price', 'minimum_nights')
calendar_par_filtered <- calendar_par[,which(colnames(calendar_par)%in%calendar_par_filtered)]

### Cleaning the listings file ###
## change name column id to listing_id ##
list_par_filtered <- list_par_filtered %>% 
    rename(listing_id = id)

### Cleaning the calender file ###
## renaming variables  ## 
calendar_par_filtered <- calendar_par_filtered %>% 
    rename(booked = available, 
           date_old = date)

# make booked a binary variable # 
calendar_par_filtered$booked <- ifelse(calendar_par_filtered$booked=='f',1,0)

# change type of date to a date #
calendar_par_filtered <- calendar_par_filtered %>% 
    group_by(date_old) %>% 
    mutate(date = as.Date(date_old))

calendar_par_filtered2 <- c('listing_id', 'date', 'booked', 'price', 'minimum_nights')
calendar_par_filtered2 <- calendar_par_filtered[,which(colnames(calendar_par_filtered)%in%calendar_par_filtered2)]

# Filter for time period (month february in 2022) #
calendar_par_filtered3 <- calendar_par_filtered2[calendar_par_filtered2$date >= "2022-02-01" &
                                                     calendar_par_filtered2$date <= "2022-02-28", ]

# Add Valentine's day dummy variable #
calendar_par_filtered3$valentinesday <- ifelse(calendar_par_filtered3$date=="2022-02-14",1,0)
table(calendar_par_filtered3$valentinesday)

#merge / right join
paris_data <- inner_join(calendar_par_filtered3, list_par_filtered, by=c('listing_id','price', 'minimum_nights'))
paris_data

#add city variable#
paris_data$city <- "Paris"
paris_data

#add number of listings variable#
paris_data$n_listings <- nrow(list_par)

summary(paris_data)

### Add City size moderator to each city dataset? or use #listings for city size moderator#

### MERGE THE FILES TO 1 ###
complete_data <- bind_rows(madrid_data, paris_data, rome_data)
complete_data

#Ouput -> write dataset to csv file
write.csv(complete_data, "../../gen/data-preparation/temp/complete_data.csv")
