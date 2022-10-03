####################
## DOWNLOAD DATA ##
###################

dir.create('../../data')

#to avoid downloading timeout#
options(timeout = max(1000, getOption("timeout")))

#downloading the files from Inside Aibnb#
files = list(c(url='http://data.insideairbnb.com/france/ile-de-france/paris/2021-12-07/data/listings.csv.gz',
               fn ='listings-paris.csv.gz'),
             c(url='http://data.insideairbnb.com/france/ile-de-france/paris/2021-12-07/data/calendar.csv.gz',
               fn='calendar-paris.csv.gz'),
             c(url ='http://data.insideairbnb.com/italy/lazio/rome/2021-12-08/data/listings.csv.gz',
               fn='listings-rome.csv.gz'),
             c(url='http://data.insideairbnb.com/italy/lazio/rome/2021-12-08/data/calendar.csv.gz',
               fn='calendar-rome.csv.gz'),
             c(url='http://data.insideairbnb.com/spain/comunidad-de-madrid/madrid/2021-12-08/data/listings.csv.gz',
               fn='listings-madrid.csv.gz'),
             c(url='http://data.insideairbnb.com/spain/comunidad-de-madrid/madrid/2021-12-08/data/calendar.csv.gz',
               fn='calendar-madrid.csv.gz'))


for (item in files) {
    download.file(item['url'], paste0('../../data/', item['fn']))
}




