DATA = ../../data
TEMP = ../../gen/temp

all: $(DATA)/listings-paris.csv.gz $(DATA)/listings-madrid.csv.gz $(DATA)/listings-rome.csv.gz $(DATA)/calendar-paris.csv.gz $(DATA)/calendar-madrid.csv.gz $(DATA)/calendar-rome.csv.gz $(TEMP)/complete_data.csv

$(DATA)/listings-paris.csv.gz $(DATA)/listings-madrid.csv.gz $(DATA)/listings-rome.csv.gz $(DATA)/calendar-paris.csv.gz $(DATA)/calendar-madrid.csv.gz $(DATA)/calendar-rome.csv.gz: download_data.R
	R --vanilla < download_data.R
	
$(TEMP)/complete_data.csv: data_cleaning.R
	R --vanilla < data_cleaning.R
	
# voor nu is complete_data enige output, als we meer files hebben moeten we hem dus uitbereiden
# weet nog niet hoe rmd file hierin verwerkt kan worden