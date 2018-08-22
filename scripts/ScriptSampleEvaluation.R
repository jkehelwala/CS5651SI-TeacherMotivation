# Participant Evaluation
participant_eval = c("Progress_Outlook", "Student_Potential", "Privileged_School_Potential", "Privileged_Family_Potential") 
school_eval = c("School_Underprivileged", "Student_Racial_Diversity", "Student_Economical_Diversity", "Student_Gaps") 

evals = c(participant_eval, school_eval)

for (i in 1:length(evals)){
	vector_name = evals[i]
	test_name = paste("Eval", vector_name, sep="_")
	output_text =  proportion_eval(test_name, q[, vector_name], "greater")
	print_output(output_text)
}