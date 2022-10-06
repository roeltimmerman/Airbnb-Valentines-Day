OUTPUT = ../../gen/output

all: $(OUTPUT)/t_test_report.html $(OUTPUT)/glm_model_report.html

$(OUTPUT)/t_test_report.html: t_test_analysis.R
	R --vanilla < t_test_analysis.R

$(OUTPUT)/glm_model_report.html:glm_analysis.R
	R --vanilla glm_analysis.R