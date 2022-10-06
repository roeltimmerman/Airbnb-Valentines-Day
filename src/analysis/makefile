OUTPUT = ../../gen/analysis/output

all: $(OUTPUT)/t_test_report.text $(OUTPUT)/glm_model_report.text

$(OUTPUT)/t_test_report.text: t_test_analysis.R
	R --vanilla < t_test_analysis.R

$(OUTPUT)/glm_model_report.text:glm_analysis.R
	R --vanilla glm_analysis.R