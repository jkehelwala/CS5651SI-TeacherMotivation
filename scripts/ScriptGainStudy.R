## Respect Tests - Feelings regarding respect currently recieved (Test for insufficiency)
respect_test_map = c("Respectful_Parents", "Respectful_School_Admins", "Respectful_Ministry_Workers", "Respectful_Financial_Workers", "Respectful_Society")

for (i in 1:length(respect_test_map)){
	col_name = respect_test_map[i]
	test_name = paste("Test", col_name, sep="_")
	param_subset = c(col_name)
	param_cols = get_complete_cases(q, base_column, param_subset)
	test_results =  single_mean_eval(test_name, param_cols[, col_name], "less") 
	print_output(test_results)
}

## Gains in Performance and Gains in Motivation via Respect (Test for significant influence)
performance_aspects = c("Performance_Training", "Performance_Transfers", "Performance_School_Administration", "Performance_Ministry_Administration") 
respect_aspects = c("More_Respectful_Parents", "More_Respectful_School_Admins", "More_Respectful_Ministry_Workers", "More_Respectful_Financial_Workers", "More_Respectful_Society") 

gains_aspects = c(performance_aspects, respect_aspects)

for (i in 1:length(gains_aspects)){
	vector_name = gains_aspects[i]
	output_text =  single_mean_eval(vector_name, q[, vector_name], "greater")
	print_output(output_text)
}
