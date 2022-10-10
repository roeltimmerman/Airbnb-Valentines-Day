DATA = ../../data
TEMP = ../../gen/data-preparation/temp
EXPLORATION = ../../src/data-preparation


all: $(DATA)/listings-paris.csv.gz $(DATA)/calendar-paris.csv.gz $(DATA)/listings-rome.csv.gz $(DATA)/calendar-rome.csv.gz $(DATA)/listings-madrid.csv.gz $(DATA)/calendar-madrid.csv.gz $(TEMP)/complete_data.csv $(EXPLORATION)/data_exploration.html
$(DATA)/listings-paris.csv.gz $(DATA)/calendar-paris.csv.gz $(DATA)/listings-rome.csv.gz $(DATA)/calendar-rome.csv.gz $(DATA)/listings-madrid.csv.gz $(DATA)/calendar-madrid.csv.gz: download_data.R
	R --vanilla < download_data.R
	
$(TEMP)/complete_data.csv: data_cleaning.R
	R --vanilla < data_cleaning.R
	
$(EXPLORATION)/data_exploration.html: data_exploration.Rmd
	Rscript -e 'rmarkdown::render("data_exploration.Rmd")'
	
#$(DATA)/listings-paris.csv.gz $(DATA)/calendar-paris.csv.gz $(DATA)/listings-rome.csv.gz