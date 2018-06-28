# proportion_props = c("Type", "Test", "Proportion", "Std.Error", "Confidence Interval", "p-value", "filestr")
# mean_props = c("Type","Test", "Mean difference", "Influence", "Std.Error", "Confidence Interval", "p-value", "filestr")
mean_analysis_df <<- data.frame()
proportion_summary <<- c("Test", "Proportion", "Std.Error", "Confidence Interval", "p-value")
mean_summary <<- c("Test", "Mean difference", "Influence", "Std.Error", "Confidence Interval", "p-value")
single_mean_summary <<- c("Test", "Mean", "Influence", "Std.Error", "Confidence Interval", "p-value")

get_column_means <- function(dframe, col_list){
	if(length(col_list)==1) { 
		return(dframe[, col_list[1]]) 
	}
	df = data.frame(Means=rowMeans(dframe[, col_list]))
	return(df[, 1])
}

get_complete_cases <- function(dframe, cols_a, cols_b){
	df = dframe[complete.cases(dframe[, c(cols_a, cols_b)]), c(cols_a, cols_b)]
	return(df)
}

get_influence <- function(mu_diff){
	if (mu_diff == 0) { return("(0)") } 
	if (mu_diff < 0){ return("(+)") } 
    else { return("(-)") }
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

get_summary <- function(passed_vector, cols){
	rows = length(passed_vector)/cols
	summary_v = matrix(passed_vector, nrow = rows,ncol = cols, byrow = TRUE) 
	return(as.data.frame(summary_v))
}

get_proportion_summary <- function(){
	return(get_summary(proportion_summary, 5))
}

get_mean_summary <- function(){
	return(get_summary(mean_summary, 6))
}

get_single_mean_summary <- function(){
	return(get_summary(single_mean_summary, 6))
}

get_mean_analysis <- function(){
	return(mean_analysis_df)
}

print_analysis <- function(print_df){
	mean_analysis_df <<- print_df
	print(print_df)
}