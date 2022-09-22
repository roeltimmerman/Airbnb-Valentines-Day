### DATA TRANSFORMATION ###
## DOWNLOAD DATA ##

dir.create('../../data')

files = list(c(url='http://data.insideairbnb.com/the-netherlands/north-holland/amsterdam/2022-09-07/data/listings.csv.gz',
               fn='listings-amsterdam.csv.gz'),
             c(url='http://data.insideairbnb.com/the-netherlands/north-holland/amsterdam/2022-09-07/data/reviews.csv.gz',
               fn='reviews-amsterdam.csv.gz'),
             c(url='http://data.insideairbnb.com/the-netherlands/north-holland/amsterdam/2022-09-07/data/calendar.csv.gz',
               fn='calendar.csv.gz'))

for (item in files) {
    download.file(item['url'], paste0('../../data/', item['fn']))
}

list_ams <- read.csv(gzfile('../../data/listings-amsterdam.csv.gz')) 
reviews_ams <- read.csv(gzfile('../../data/reviews-amsterdam.csv.gz'))
calendar_ams <- read.csv(gzfile('../../data/calendar.csv.gz'))
