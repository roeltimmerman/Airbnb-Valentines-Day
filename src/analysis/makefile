OUTPUT = ../../gen/analysis/output

all: $(OUTPUT)/analysis_report_1.html $(OUTPUT)/analysis_report_2.html $(OUTPUT)/analysis_report_3.html

$(OUTPUT)/analysis_report_1.html: analysis_1.R
	R --vanilla < t_test_analysis.R

$(OUTPUT)/analysis_report_2.html: analysis_2.R
	R --vanilla glm_analysis.R
	
$(OUTPUT)/analysis_report_3.html: analysis_3.R