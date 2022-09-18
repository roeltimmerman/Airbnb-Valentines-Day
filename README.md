# The effect of Valentine's Day on Airbnb listings
This research project is part of the [Data Preparation and Workflow Management (dPrep)](https://dprep.hannesdatta.com/) course at Tilburg University. The research answers the following research question:

How does Valentine's Day affect the price and accommodation type of Airbnb listings?

## Motivation
Valentine's day is celebrated yearly on 14 February. It is a day when romance takes centre stage and people show their love for each other with accompanying rituals. Specific behaviours and rituals that people often perform are giving gifts, showing affection, or going out for dinner or a romantic getaway [(Close & Zinkhan, 2006)](https://www.acrwebsite.org/volumes/v33/v33_10020.pdf). Consequently, for overnight stays, Airbnb accommodation is often booked. It therefore sounds reasonable that there would be more demand for Airbnb listings around this holiday. If demand increases, hosts can charge higher prices for their accomodations. Moreover, more accommodations for 2 people are likely to be booked, as couples usually celebrate Valentine's Day.

Based on the aformentioned, the following research question was proposed:
'How does Valentine's Day affect the price and accommodation type of Airbnb listings?'

Furthermore, we distinguish between different cities in Europe, as not every country celebrates Valentine's Day to the same extent and/or not every city is equally popular. In addition, we look at whether it matters whether Valentine's Day falls on a weekend or not. For example, if Valentine's Day falls on a Monday, people may be less inclined to book an overnight stay than if it falls on a Friday. It is then possible that guests might postpone their overnight stays until the weekend. As a result, we will look at data from different years. The time period used is ...

## Data
The data used in this research project was obtained from [Inside Airbnb](http://insideairbnb.com/).


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
