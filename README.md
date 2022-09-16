# Introduction
Valentine's day is celebrated yearly on 14 February. It is a day when people show their love for each other by giving presents, eating out or going on trips. As more people go on trips, the demand of Airbnb's will increase. As the demand increases, hosts can charger higher prices for their accomodations. Besides that, as mostly couples will go on a trip, more accommodations for 2 people a likely to be booked. 

Based on the aformentioned introduction, the following research question has been proposed:
'What is the influence of Valentine's day on the price and accomodation type of rented Airbnb's?'

The data ...


## Dependencies
- R 
- R packages: `install.packages("stargazer")`
- [Gnu Make](https://tilburgsciencehub.com/get/make) 
- [TeX distribution](https://tilburgsciencehub.com/get/latex/?utm_campaign=referral-short)
- For the `makefile` to work, R, Gnu make and the TeX distribution (specifically `pdflatex`) need to be made available in the system path 
- Detailed installation instructions can be found here: [tilburgsciencehub.com](http://tilburgsciencehub.com/)


## Notes
- `make clean` removes all unncessary temporary files. 
- Tested under Linux Mint (should work in any linux distro, as well as on Windows and Mac) 
- IMPORTANT: In `makefile`, when using `\` to split code into multiple lines, no space should follow `\`. Otherwise Gnu make aborts with error 193. 
- Many possible improvements remain. Comments and contributions are welcome!


## Research questions
1. Do negative Tweets influence the price of an Airbnb listing in different cities?

2. Is the rental rate of Airbnb listings higher in smaller or bigger cities?

3. Which city characteristics influence the price of an Airbnb listing?
