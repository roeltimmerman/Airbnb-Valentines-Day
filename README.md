# How far can you go for real love on Airbnb?

Welcome to our research project! This research aims to answer the following research question:

**What is the effect of Valentine's Day on Airbnb listings in Europe?**

![This is an image](https://turntable.kagiso.io/images/romantic_bedroom.width-800.jpg)

## Motivation
Valentine's day is celebrated yearly on the 14th of February. It is a day when romance takes centre stage and people show their love for each other with accompanying rituals. Specific behaviours and rituals that people often perform are giving gifts, showing affection, or going out for dinner or a romantic getaway [(Close & Zinkhan, 2006)](https://www.acrwebsite.org/volumes/v33/v33_10020.pdf). For overnight stays, Airbnb accommodation is often booked.

Therefore, this study proposes the following research question:

*What is the effect of Valentine's Day on Airbnb listings?*

During this project, we will zoom in on three major cities in Europe. We find this interesting as countries cebelrate Valentine's Day with different intensities. Furthermore, will be focusing on the following subquestions:
1. What is the influence of Valentine's Day on the price of Airbnb listings?
2. What is the influence of Valentine's Day on the number of booked Airbnb listings? 
3. Compared to 'normal days', are relatively more Airbnb accommodations with one/two beds booked during Valentine's Day?

These sub-questions will include comparisons between the cities of Paris, Rome and mMadrid. We have chosen these cities as celebrating Valentine's Day is very popular in these places. 

We expect that there will be an increase in demand for Airbnb accomodations during Valentine's Day. When demand increases, hosts are allowed to charge higher prices for their accomodations. Therefore, we expect the average price of Airbnb listings to increase during Valentines's Day. Moreover, we expect that more accommodations for 2 people are likely to be booked, as couples usually celebrate Valentine's Day. Lastly, we expect to see a difference in the number of bookings during Valentin's day to be bigger in large cities. 

## Data
The data used in this research project was obtained from [Inside Airbnb](http://insideairbnb.com/). For this research, we looked into the data starting from two weeks before Valentine's Day 2022 (January 31st) untill two weeks after Valentine's day 2022 (February 28th). We created a dummy for Valentine's Day, this allowed us to compare the effect of Valentine's Day with other, 'normal' days. For this analysis, we compare three major cities in Europe: Paris, Rome and Madrid. 

## Method and results

**Method**

As discussed above Data from Inside Airbnb will be used to look at three different cities in Europe regarding their Airbnb listings in the month of februari and especially Valentine's Day. The analysis of the Airbnb data will start with the city Paris, and will later expand to doing the same analysis for the other cities in Europe. 

**Variables**

Dependent variables: Price, Booking of listing, Number of beds in booked listings

Independent variable: Valentine's Day

Moderator: City (Paris/Rome/Madrid)

Variable | Description
-------- | --------
price | The price of the Airbnb listing in dollars
bookings | Dummy variable: whether the accommodation is unbooked (0) or booked (1)
beds | Dummy variable: zero or more than two beds (0) or one or two beds (1)
valentinesday | Dummy variable: whether it is not Valentine's Day (0) or it is (1)
city | The city where the Airbnb ad is located (Madrid, Paris or Rome)

![Schermafbeelding 2022-10-14 om 11 49 06](https://user-images.githubusercontent.com/112401369/195817813-da1a32ac-452d-42ed-ad10-9fd6e870779e.png)


**Analysis**

In order to answer the research question, we used several types of analysis. For the analysis of the effect of Valentine's Day on the price Airbnb listings, a t-test has been performed. In addition, a logistic regression was performed to examine the effect of Valentine's Day on the number of bookings. This type of regression was also used to examine whether accommodations with fewer (one/two) beds are booked during Valentine's Day. We compared the outcomes of different cities (Madrid, Paris, Rome) in all these analyses.

**Results**

The null hypothesis of the price analysis stated as follows: Valentine's day has no influence on the prices of Airbnb listings. The result from the T-test for all cities together, as for the separate cities, a P-value of >0.05 has been found. Therefore, with a significance of 0.05, the H0 could not be rejected. No significant relation has been found between Valentine's Day and prices of Airbnb listings. 

Next, the null hypothesis for the bookings analysis stated as follows: Valentine's day has no influence on the amount of booked Airbnb's. The result from the logistic regression show a P-value<0.01. Therefore, with a significance of 0.05, the null hypothesis could be rejected. On Valentine's Day, the odds of a listing being booked, increases with 1.03. Looking at the exponents, we found a small difference of this effect between cities. On Valentine's Day, the odds of booked Airnbnb's in Madrid decrease by a value of 0.996. While in Rome, these odds increase by a value of 1.006 and in Paris by a value of 1.006. From the exponents, we can conclude that the odds of an Airbnb being booked on Valentine's Day, is the greatest in Paris. 

Lastly, the null hypothesis for the bookings analysis stated as follows: Valentine's day has no influence on the number of beds in booked Airbnb's. The P-value of the logistic regression and log likelihood are both >0.05. Therefore, with a significance of 0.05, the H0 could not be rejected. No significant relation has been found between Valentine's Day and the number of beds in booked Airbnb's.


## Conclusion

Answering our research question, no significant relation has been found between Valentine's day and the prices of Airbnb listings. This is the case both for the accommodations in paris, rome and madrid together and for the cities separately. Secondly, a significant relation has been found between Valentine's Day and the changes of an Airbnb listing being booked. However, although the changes of a listing being booked in Paris and Rome increase on Valentine's Day, the chance of a booking decreases in Madrid on this day. Lastly, No significant relation has been found between Valentine's Day and the number of beds in the airbnbs booked.

## Repository overview
```
├── README.md
├── data
├── gen
│   ├── analysis
│   │   └── output
│   ├── data-preparation
│   │   └── temp
│   └── paper
└── src
    ├── analysis
    ├── data-preparation
    └── paper
```
## Dependencies

Add installed packages etc.
- Install [R and RStudio](https://tilburgsciencehub.com/building-blocks/configure-your-computer/statistics-and-computation/r/).
- Install [make](https://tilburgsciencehub.com/building-blocks/configure-your-computer/automation-and-workflows/make/).

For R, install the following packages:
```
install.packages('tidyverse')
install.packages('dplyr')
install.packages('ggplot2')
install.packages('readr')
install.packages('stringr')
install.packages('ggpubr') 
install.packages('car') 
install.packages('scales')
install.packages('stargazer')
```

## Running instructions

**Step-by-step**

To run the code, we recommend using the make file. Please follow the following instructions:

1. Fork this repository

2. Open your command line / terminal and run:

```
git clone https://github.com/{your username}/Airbnb-Valentines-Day.git
```

3. Set your working directory to:

```
Airbnb-Valentines-Day
```

4. Run make using the following command:

```
make
```

Make will run all code and delete all raw and unnecessary data files created during the pipeline.

Alternatively, one can run the scripts/files in the following order:

- install_packages.R
- download_data.R
- data_cleaning.R
- data_exploration.Rmd
- price_analysis.R
- bookings.analysis.R
- beds.analysis.R
- report.Rmd

## About

This research project is part of the [Data Preparation and Workflow Management (dPrep)](https://dprep.hannesdatta.com/) course at Tilburg University and is conducted by Team 12. The contributors of the research are:
- [Anouk Bor](https://github.com/AnoukBor)
- [Eva Bos](https://github.com/EvaBos)
- [Bi Xuan Guo](https://github.com/bixuanguo)
- [Mandana Khabbazi](https://github.com/Mandanakhabbazi)
- [Indi Wieggers](https://github.com/indiwieggers123)
