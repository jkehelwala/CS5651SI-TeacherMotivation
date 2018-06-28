####################################################
### Tests

test_list = list()
test_map = c("Student_Participation", "Student_Backgrounds", "Parent_Involvement", 
	"Working_Hours", "Salary", "Vacation_Time", "Teacher_Training", "Administrative_Interference")
test_tail_map = c(TRUE, FALSE, TRUE, TRUE, FALSE, TRUE, TRUE, FALSE ) # lower_tail
# If the aspect is positive, it will result a negative value, therefore tail would be lower

test_list[[1]] = c("Student_Engagement", "Student_Interference", "Student_Appreciation")
test_list[[2]] = c("Student_Social_Context", "Student_Financial_Context")
test_list[[3]] = c("Parent_Presence", "Parent_Interest", "Parent_Response")
test_list[[4]] = c("Working_Hours")
test_list[[5]] = c("Salary")
test_list[[6]] = c("Vacation_Days")
test_list[[7]] = c("Training")
test_list[[8]] = c("Transfers", "School_Administration", "Ministry_Administration")

base_column = "Current_Attitude"
for (i in 1:length(test_list)){
	test_name = paste("Test", test_map[i], sep="_")
	param_subset = test_list[[i]]
	param_cols = get_complete_cases(q, base_column, param_subset)
	compare_column = get_column_means(param_cols, param_subset)
	test_results =  mean_comparison(test_name, param_cols[, base_column], compare_column, test_tail_map[i])
	print_output(test_results)
}

####################################################
### Alternative Tests

alt_test_list = list()
alt_test_map = c("Student_Positive_Participation", "Parent_Positive_Participation", "Transfers", "Ministry_Administration")
alt_test_tail_map = c(TRUE, TRUE, FALSE, FALSE) # lower_tail
# If the aspect is positive, it will result a negative value, therefore tail would be lower

alt_test_list[[1]] = c("Student_Engagement", "Student_Appreciation")
alt_test_list[[2]] = c("Parent_Presence", "Parent_Interest")
alt_test_list[[3]] = c("Transfers")
alt_test_list[[4]] = c("Ministry_Administration")

for (i in 1:length(alt_test_list)){
	test_name = paste("AltTest", alt_test_map[i], sep="_")
	param_subset = alt_test_list[[i]]
	param_cols = get_complete_cases(q, base_column, param_subset)
	compare_column = get_column_means(param_cols, param_subset)
	test_results =  mean_comparison(test_name, param_cols[, base_column], compare_column, alt_test_tail_map[i])
	print_output(test_results)
}

####################################################
### Performance Gains Tests

performance_aspects = c("Performance_Training", "Performance_Transfers", "Performance_School_Administration", "Performance_Ministry_Administration") 
performance_tail = FALSE   # Since the decisions are taken to improve performance, mean should be higher than H0

for (i in 1:length(performance_aspects)){
	vector_name = performance_aspects[i]
	# test_name = paste("Performance", vector_name, sep="_")
	output_text =  single_mean_eval(vector_name, q[, vector_name], performance_tail)
	print_output(output_text)
}