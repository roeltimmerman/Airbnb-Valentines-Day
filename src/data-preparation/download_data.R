####################
## DOWNLOAD DATA ##
###################

dir.create('../../data')

#to avoid downloading timeout#
options(timeout = max(1000, getOption("timeout")))

#downloading the files from Inside Airbnb#
files = list(c(url='http://data.insideairbnb.com/france/ile-de-france/paris/2021-12-07/data/listings.csv.gz',
               fn ='listings-paris.csv.gz'),
             c(url='http://data.insideairbnb.com/france/ile-de-france/paris/2021-12-07/data/calendar.csv.gz',
               fn='calendar-paris.csv.gz'),
             c(url='http://data.insideairbnb.com/france/ile-de-france/paris/2021-12-07/data/reviews.csv.gz',
               fn='reviews-paris.csv.gz'),
             c(url ='http://data.insideairbnb.com/italy/lazio/rome/2021-12-08/data/listings.csv.gz',
               fn='listings-rome.csv.gz'),
             c(url='http://data.insideairbnb.com/italy/lazio/rome/2021-12-08/data/calendar.csv.gz',
               fn='calendar-rome.csv.gz'),
             c(url='http://data.insideairbnb.com/italy/lazio/rome/2021-12-08/data/reviews.csv.gz',
               fn='reviews-rome.csv.gz'),
             c(url='http://data.insideairbnb.com/spain/comunidad-de-madrid/madrid/2021-12-08/data/listings.csv.gz',
               fn='listings-madrid.csv.gz'),
             c(url='http://data.insideairbnb.com/spain/comunidad-de-madrid/madrid/2021-12-08/data/calendar.csv.gz',
               fn='calendar-madrid.csv.gz'),
             c(url='http://data.insideairbnb.com/spain/comunidad-de-madrid/madrid/2021-12-08/data/reviews.csv.gz',
               fn='reviews-madrid.csv.gz'))


for (item in files) {
    download.file(item['url'], paste0('../../data/', item['fn']))
}

# store data for Paris
list_par <- read.csv(gzfile('../../data/listings-paris.csv.gz')) 
calendar_par <- read.csv(gzfile('../../data/calendar-paris.csv.gz'))
reviews_par <- read.csv(gzfile('../../data/reviews-paris.csv.gz'))

# store data for Rome
list_rom <- read.csv(gzfile('../../data/listings-rome.csv.gz')) 
calendar_rom <- read.csv(gzfile('../../data/calendar-rome.csv.gz'))
reviews_rom <- read.csv(gzfile('../../data/reviews-rome.csv.gz'))

# store data for Madrid
list_mad <- read.csv(gzfile('../../data/listings-madrid.csv.gz')) 
calendar_mad <- read.csv(gzfile('../../data/calendar-madrid.csv.gz'))
reviews_mad <- read.csv(gzfile('../../data/reviews-madrid.csv.gz'))
