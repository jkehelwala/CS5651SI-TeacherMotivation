base_column = "Current_Attitude"

## Test - Motivation Decline Evaluation
attitude_compare = get_complete_cases(q, "Most_Positive_Attitude", base_column)
motivation_drop =  mean_comparison("Test_Motivation_Drop", attitude_compare$Most_Positive_Attitude, attitude_compare$Current_Attitude, "greater")
print_output(motivation_drop)

## Test - Motivation Decline Evaluation with Valid Samples
attitude_compare = attitude_compare[(attitude_compare[,1]>=attitude_compare[,2]),]
motivation_drop_full =  mean_comparison("Test_Motivation_Drop_Full_Cases", attitude_compare$Most_Positive_Attitude, attitude_compare$Current_Attitude, "greater")
print_output(motivation_drop_full)

## Tests - Contribution to Motivation
test_map = c()
test_map = c(test_map, "Most_Positive_Attitude", "Current_Attitude") 
test_map = c(test_map, "Student_Engagement", "Student_Interference", "Student_Appreciation")
test_map = c(test_map, "Student_Social_Context", "Student_Financial_Context")
test_map = c(test_map, "Parent_Presence", "Parent_Interest", "Parent_Response")
test_map = c(test_map, "Working_Hours", "Salary", "Vacation_Days","Training")
test_map = c(test_map, "Transfers", "School_Administration", "Ministry_Administration")


test_tails = c()
test_tails = c(test_tails, "greater", "greater")
test_tails = c(test_tails, "greater", "less", "greater")
test_tails = c(test_tails, "less", "less")
test_tails = c(test_tails, "greater", "greater", "greater")
test_tails = c(test_tails, "greater", "less", "greater", "greater")
test_tails = c(test_tails, "less", "less", "less")

for (i in 1:length(test_map)){
	col_name = test_map[i]
	test_name = paste("Test", col_name, sep="_")
	param_subset = c(col_name)
	param_cols = get_complete_cases(q, base_column, param_subset)
	test_results =  single_mean_eval(test_name,  param_cols[, col_name], test_tails[i])
	print_output(test_results)
}
