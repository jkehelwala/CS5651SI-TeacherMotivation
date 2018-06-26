# Participant Evaluation
participant_eval = c("Progress_Outlook", "Student_Potential", "Privileged_School_Potential", "Privileged_Family_Potential", "Most_Positive_Attitude", "Current_Attitude") 
participant_eval_means =  c(0.5, 0.5, 0.5, 0.5, 3, 3)   

for (i in 1:length(participant_eval)){
	vector_name = participant_eval[i]
	lower_tail = mean(q[, vector_name], na.rm=TRUE) < participant_eval_means[i]
	output_text =  proportion_eval(gsub("_", " ", vector_name), q[, vector_name], lower_tail)
	print_output(output_text)
}

# School Evaluation
school_eval = c("School_Underprivileged", "Student_Racial_Diversity", "Student_Economical_Diversity", "Student_Gaps") 
school_eval_means =  c(0.5, 0.5, 0.5, 0.5)

for (i in 1:length(school_eval)){
	vector_name = school_eval[i]
	lower_tail = mean(q[, vector_name], na.rm=TRUE) < school_eval_means[i]
	output_text =  proportion_eval(gsub("_", " ", vector_name), q[, vector_name], lower_tail)
	print_output(output_text)
}

## Test - Motivation Decline Evaluation
attitude_compare = get_complete_cases(q, "Most_Positive_Attitude", "Current_Attitude")
motivation_drop =  mean_comparison("MC Motivation Drop", attitude_compare$Most_Positive_Attitude, attitude_compare$Current_Attitude)
print_output(motivation_drop)