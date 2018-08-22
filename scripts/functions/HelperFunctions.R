mean_analysis_df <<- data.frame()
proportion_summary <<- c("Test", "Proportion", "Std.Error", "CI Low", "CI High", "p-value", "sample_size")
mean_summary <<- c("Test", "Mean difference", "Influence", "Std.Error",  "CI Low", "CI High", "p-value", "sample_size")
single_mean_summary <<- c("Test", "Mean", "Influence", "Std.Error",  "CI Low", "CI High", "p-value", "sample_size")
definitions = list(proportion_summary, mean_summary, single_mean_summary)

get_complete_cases <- function(dframe, cols_a, cols_b){
	df = dframe[complete.cases(dframe[, c(cols_a, cols_b)]), c(cols_a, cols_b)]
	return(df)
}

print_output <- function(vector_x, main_table){
	cat(vector_x[length(vector_x)])
	last_col = length(vector_x)-1 
	if(vector_x[1] == "Type1"){
		proportion_summary <<- c(proportion_summary, vector_x[2:last_col])
	}
	if(vector_x[1] == "Type2"){
		mean_summary <<- c(mean_summary, vector_x[2:last_col])
	}
	if(vector_x[1] == "Type3"){
		single_mean_summary <<- c(single_mean_summary, vector_x[2:last_col])
	}
}

get_summary <- function(passed_vector, type){
	cols = length(definitions[[type]])
	rows = length(passed_vector)/cols
	summary_v = matrix(passed_vector, nrow = rows,ncol = cols, byrow = TRUE) 
	return(as.data.frame(summary_v))
}

get_proportion_summary <- function(){
	return(get_summary(proportion_summary, 1))
}

get_mean_summary <- function(){
	return(get_summary(mean_summary, 2))
}

get_single_mean_summary <- function(){
	return(get_summary(single_mean_summary, 3))
}

get_mean_analysis <- function(){
	return(mean_analysis_df)
}

print_analysis <- function(print_df){
	mean_analysis_df <<- print_df
	print(print_df)
}
