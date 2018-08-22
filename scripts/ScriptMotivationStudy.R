base_column = "Current_Attitude"

## Test - Motivation Decline Evaluation
attitude_compare = get_complete_cases(q, "Most_Positive_Attitude", base_column)
motivation_drop =  mean_comparison("Test_Motivation_Drop", attitude_compare$Most_Positive_Attitude, attitude_compare$Current_Attitude, FALSE)
print_output(motivation_drop)

## Test - Motivation Decline Evaluation with Valid Samples
attitude_compare = get_complete_cases(q, "Most_Positive_Attitude", base_column)
attitude_compare = attitude_compare[(attitude_compare[,1]>=attitude_compare[,2]),]
motivation_drop =  mean_comparison("Test_Motivation_Drop_Full_Cases", attitude_compare$Most_Positive_Attitude, attitude_compare$Current_Attitude, FALSE)
print_output(motivation_drop)

## Tests - Contribution to Motivation
test_map = c()
test_map = c(test_map, "Student_Engagement", "Student_Interference", "Student_Appreciation")
test_map = c(test_map, "Student_Social_Context", "Student_Financial_Context")
test_map = c(test_map, "Parent_Presence", "Parent_Interest", "Parent_Response")
test_map = c(test_map, "Working_Hours", "Salary", "Vacation_Days","Training")
test_map = c(test_map, "Transfers", "School_Administration", "Ministry_Administration")

test_tails = c()
test_tails = c(test_tails, FALSE, TRUE, FALSE)
test_tails = c(test_tails, TRUE, TRUE)
test_tails = c(test_tails, FALSE, FALSE, FALSE)
test_tails = c(test_tails, FALSE, TRUE, FALSE, FALSE)
test_tails = c(test_tails, TRUE, FALSE, FALSE)

for (i in 1:length(test_map)){
	col_name = test_map[i]
	test_name = paste("Test", col_name, sep="_")
	param_subset = c(col_name)
	param_cols = get_complete_cases(q, base_column, param_subset)
	test_results =  single_mean_eval(test_name,  param_cols[, col_name], test_tails[i])
	print_output(test_results)
}


## Attitude Evaluation
attitude_aspects = c("Most_Positive_Attitude", "Current_Attitude") 
for (i in 1:length(attitude_aspects)){
	vector_name = attitude_aspects[i]
	test_name = paste("Test", vector_name, sep="_")
	output_text =  single_mean_eval(vector_name, q[, vector_name], FALSE)
	print_output(output_text)
}
