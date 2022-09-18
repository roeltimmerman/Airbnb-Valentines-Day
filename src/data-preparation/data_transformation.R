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
list_ams_filtered <- c('id', 'host_id', 'neighborhood_overview', 'host_since', 'hosts_location', 'host_neighbourhood', 'neighbourhood_cleansed', 'room_type', 'minimum_nights', 'price')
data_frame_ams <- list_ams[,which(colnames(list_ams)%in%list_ams_filtered)]

# RENAMING VARIABLES # 
rename(data_frame_ams, #willen we namen veranderen van variabelen? 
       )

# CHECKING 


