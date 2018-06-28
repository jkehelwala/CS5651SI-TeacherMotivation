####################################################
### Respect Study

test_list = list()
test_map = c("Respectful_Parents", "Respectful_School_Admins", "Respectful_Ministry_Workers", "Respectful_Financial_Workers", "Respectful_Society",
	"Respectful_Overall")
# Lower tails, if the aspect is positive, it will result a negative value, therefore tail would be lower

test_factors = length(test_map)-1
length(test_map)
test_factors
for(i in 1:test_factors) { test_list[[i]] = c(test_map[i]) }
test_list[[test_factors+1]] = test_map[1:test_factors]

base_column = "Current_Attitude"
for (i in 1:length(test_list)){
	test_name = test_map[i]
	param_subset = test_list[[i]]
	param_cols = get_complete_cases(q, base_column, param_subset)
	compare_column = get_column_means(param_cols, param_subset)
	test_results =  mean_comparison(test_name, param_cols[, base_column], compare_column, TRUE)
	print_output(test_results)
}

####################################################
### Respect effects tests

respect_aspects = c("More_Respectful_Parents", "More_Respectful_School_Admins", 
	"More_Respectful_Ministry_Workers", "More_Respectful_Financial_Workers", "More_Respectful_Society") 
respect_tail = FALSE   # Since more respect would mean higher motivation, mean should be higher than H0

for (i in 1:length(respect_aspects)){
	vector_name = respect_aspects[i]
	output_text =  single_mean_eval(vector_name, q[, vector_name], respect_tail)
	print_output(output_text)
}

# Overall Increased Respect
respect_cols = get_complete_cases(q, respect_aspects, c())
respect_mean_col = get_column_means(respect_cols, respect_aspects)
test_results =  single_mean_eval("More_Respectful_Overall", respect_mean_col, respect_tail)
print_output(test_results)