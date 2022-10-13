# How far can you go for love on Airbnb? - The effect of Valentine's Day on Airbnb listings

Welcome to our research project! This research aims to answer the following research question:

**What is the effect of Valentine's Day on Airbnb listings in Europe?**

![This is an image](https://turntable.kagiso.io/images/romantic_bedroom.width-800.jpg)

## Motivation
Valentine's day is celebrated yearly on the 14th of February. It is a day when romance takes centre stage and people show their love for each other with accompanying rituals. Specific behaviours and rituals that people often perform are giving gifts, showing affection, or going out for dinner or a romantic getaway [(Close & Zinkhan, 2006)](https://www.acrwebsite.org/volumes/v33/v33_10020.pdf). For overnight stays, Airbnb accommodation is often booked.

Therefore, this study proposes the following research question:

*What is the effect of Valentine's Day on Airbnb listings in Europe?*

During this project, we will zoom in on several major cities in Europe. We find this interesting as countries cebelrate Valentine's Day with different intensities. Furthermore, will be focusing on the following subquestions:
1.  What is the effect of Valentine's Day on the price of Airbnb listings in 'city'?
2. Is there a significant difference in the number of bookings on Airbnb on Valentine's day? If so, is this difference also greater in a city with a larger population?
3. Compared to 'normal days', are relatively more Airbnb accommodations with one/two beds booked during Valentine's Day?

We expect that there will be an increase in demand for Airbnb accomodations during Valentine's Day. When demand increases, hosts are allowed to charge higher prices for their accomodations. Therefore, we expect the average price of Airbnb listings to increase during Valentines's Day. Moreover, we expect that more accommodations for 2 people are likely to be booked, as couples usually celebrate Valentine's Day. Lastly, we expect to see a difference in the number of bookings during Valentin's day to be bigger in large cities. 

## Data
The data used in this research project was obtained from [Inside Airbnb](http://insideairbnb.com/). For this research, we looked into the data starting from two weeks before Valentine's Day 2022 (January 31st) untill two weeks after Valentine's day 2022 (February 18th). We created a dummy for Valentine's Day, this allowed us to compare the effect of Valentine's Day with other, 'normal' days. For this analysis, we compare three major cities in Europe: Paris, Rome and Madrid. 

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

![Conceptual model](https://user-images.githubusercontent.com/91567676/195590567-2f9e9970-d5a2-4043-8b22-a1517a0df328.png)

**Analysis**

In order to answer the research question, we used several types of analysis. For the analysis of the effect of Valentine's Day on the price Airbnb listings, a t-test has been performed. In addition, a logistic regression was performed to examine the effect of Valentine's Day on the number of bookings. This type of regression was also used to examine whether accommodations with fewer (one/two) beds are booked during Valentine's Day. We compared the outcomes of different cities (Madrid, Paris, Rome) in all these analyses.

**Results**

Add results

**Conclusion**

From the first analysis, we can conclude that there is no statistically significant finding on the influence of Valentine's Day on the price of Airbnb listings. Therefore, we cannot draw any conclusions about the influence of Valentine's Day on the price of listings in Madrid, Paris and Rome. From the second analysis, we can conclude that Valentine's Day has a significant effect on the number of bookings. However, if we look at the cities separately, we see no significant effect and can therefore only conclude that for Rome, Madrid and Paris together, Valentine's Day has an effect. Finally, we also found no statistically significant results for the number of beds in the last analysis. Again, we cannot conclude that Valentine's Day has an effect on the number of beds per Airbnb booking. This again means that there is no significant impact of Valentine's Day on the number of beds per Airbnb booked in Madrid, Paris and Rome.

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

- Install [Python](https://tilburgsciencehub.com/building-blocks/configure-your-computer/statistics-and-computation/python/).
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
install.packages('knitr')
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
