base_column = "Current_Attitude"

####################################################
# ## Test - Student Behavioural Factors

student_eval = c("Student_Engagement", "Student_Interference", "Student_Social_Context", "Student_Financial_Context", "Student_Appreciation") 

for (i in 1:length(student_eval)){
	vector_name = student_eval[i]
	comp_cases = get_complete_cases(q, base_column, vector_name)
	output_text = mean_comparison(paste("MC", gsub("_", " ", vector_name)), comp_cases[, base_column], comp_cases[, vector_name])
	print_output(output_text)
}

# ## Test - All Student Behavioural Factors
student_cols = get_complete_cases(q, base_column, student_eval)
student_cols_means = get_column_means(student_cols, student_eval)
student_influence =  mean_comparison("MC Student Influence", student_cols[, base_column], student_cols_means)
print_output(student_influence)

####################################################
# ## Test - Parental Behavioural Factors

parental_eval = c("Parent_Presence", "Parent_Interest", "Parent_Response") 

for (i in 1:length(parental_eval)){
	vector_name = parental_eval[i]
	comp_cases = get_complete_cases(q, base_column, vector_name)
	output_text = mean_comparison(paste("MC", gsub("_", " ", vector_name)), comp_cases[, base_column], comp_cases[, vector_name])
	print_output(output_text)
}

# ## Test - All Student Behavioural Factors
parental_cols = get_complete_cases(q,base_column, parental_eval)
parental_cols_means = get_column_means(parental_cols, parental_eval)
student_influence =  mean_comparison("MC Parental Influence", parental_cols[, base_column], parental_cols_means)
print_output(student_influence)

####################################################
# ## Test - Parental Behavioural Factors