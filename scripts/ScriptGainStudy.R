## Respect Tests - Feelings regarding respect currently recieved (Test for insufficiency)
respect_test_map = c("Respectful_Parents", "Respectful_School_Admins", "Respectful_Ministry_Workers", "Respectful_Financial_Workers", "Respectful_Society")

for (i in 1:length(respect_test_map)){
	col_name = respect_test_map[i]
	test_name = paste("Test", col_name, sep="_")
	param_subset = c(col_name)
	param_cols = get_complete_cases(q, base_column, param_subset)
	test_results =  single_mean_eval(test_name, param_cols[, col_name], TRUE) 
	print_output(test_results)
}


gains_tail = FALSE
# Since the aspects should imprve performans, mean is higher than h0

## Gains in Performance
performance_aspects = c("Performance_Training", "Performance_Transfers", "Performance_School_Administration", 
	"Performance_Ministry_Administration") 
for (i in 1:length(performance_aspects)){
	vector_name = performance_aspects[i]
	output_text =  single_mean_eval(vector_name, q[, vector_name], gains_tail)
	print_output(output_text)
}

## Gains in Motivation via Respect
respect_aspects = c("More_Respectful_Parents", "More_Respectful_School_Admins", 
	"More_Respectful_Ministry_Workers", "More_Respectful_Financial_Workers", "More_Respectful_Society") 

for (i in 1:length(respect_aspects)){
	vector_name = respect_aspects[i]
	output_text =  single_mean_eval(vector_name, q[, vector_name], gains_tail)
	print_output(output_text)
}
