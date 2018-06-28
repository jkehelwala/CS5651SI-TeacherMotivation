# Participant Evaluation
participant_eval = c("Progress_Outlook", "Student_Potential", "Privileged_School_Potential", "Privileged_Family_Potential", "Most_Positive_Attitude", "Current_Attitude") 
participant_eval_tails =  c(FALSE, FALSE, TRUE, FALSE, FALSE, FALSE)   # Lower tail

for (i in 1:length(participant_eval)){
	vector_name = participant_eval[i]
	test_name = paste("Eval", vector_name, sep="_")
	output_text =  proportion_eval(test_name, q[, vector_name], participant_eval_tails[i])
	print_output(output_text)
}

# School Evaluation
school_eval = c("School_Underprivileged", "Student_Racial_Diversity", "Student_Economical_Diversity", "Student_Gaps") 
school_eval_tails =  c(FALSE, FALSE, FALSE, FALSE) # Lower tail

for (i in 1:length(school_eval)){
	vector_name = school_eval[i]
	test_name = paste("Eval", vector_name, sep="_")
	output_text =  proportion_eval(test_name, q[, vector_name], school_eval_tails[i])
	print_output(output_text)
}

## Test - Motivation Decline Evaluation
attitude_compare = get_complete_cases(q, "Most_Positive_Attitude", "Current_Attitude")
motivation_drop =  mean_comparison("Test_Motivation_Drop", attitude_compare$Most_Positive_Attitude, attitude_compare$Current_Attitude, FALSE)
print_output(motivation_drop)