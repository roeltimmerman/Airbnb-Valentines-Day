### DATA TRANSFORMATION ###
## DOWNLOAD DATA ##

listings_amsterdam 

urls = c('http://data.insideairbnb.com/the-netherlands/north-holland/amsterdam/2022-09-07/visualisations/listings.csv', 'http://data.insideairbnb.com/the-netherlands/north-holland/amsterdam/2022-09-07/visualisations/reviews.csv')

for (url in urls) {
    filename = paste(gsub('[^a-zA-Z]', '', url), '.csv') 
    filename = gsub('httpdatainsideairbnbcom', '', filename) 
    download.file(url, destfile = filename) 
}