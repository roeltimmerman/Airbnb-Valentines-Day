TEMP = ../../gen/data-preparation/temp
ANALYSIS = ../../gen/analysis/output
REPORT = ../../src/analysis/

all: $(ANALYSIS)/price_valentinesday_boxplot.pdf $(ANALYSIS)/histogram_prices.pdf $(ANALYSIS)/valentinesday_yes_no $(ANALYSIS)/boxplot_price_per_city.pdf $(ANALYSIS)/histogram_booked.pdf $(ANALYSIS)/histogram_total_bookings.pdf $(ANALYSIS)/histogram_beds.pdf $(ANALYSIS)/beds_booked_valentinesday.pdf $(REPORT)/report.html

$(ANALYSIS)/price_valentinesday_boxplot.pdf $(ANALYSIS)/histogram_prices.pdf $(ANALYSIS)/valentinesday_yes_no $(ANALYSIS)/boxplot_price_per_city.pdf: $(TEMP)/complete_data.csv
	R --vanilla < price_analysis.R

# output t-test nog toevoegen

$(ANALYSIS)/histogram_booked.pdf $(ANALYSIS)/histogram_total_bookings.pdf: $(TEMP)/complete_data.csv
	R --vanilla < bookings_analysis.R
	
# output analysis nog toevoegen

$(ANALYSIS)/histogram_beds.pdf $(ANALYSIS)/beds_booked_valentinesday.pdf: $(TEMP)/complete_data.csv
	R --vanilla < beds_analysis.R
	
# output analysis nog toevoegen

$(REPORT)/report.html: report.Rmd
	Rscript -e 'rmarkdown::render("report.Rmd", output_format="all")'
