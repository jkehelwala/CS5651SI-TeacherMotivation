# proportion_props = c("Type", "Test", "Proportion", "Std.Error", "Confidence Interval", "p-value", "filestr")
# mean_props = c("Type","Test", "Mean difference", "Influence", "Std.Error", "Confidence Interval", "p-value", "filestr")
proportion_summary <<- c("Test", "Proportion", "Std.Error", "Confidence Interval", "p-value")
mean_summary <<- c("Test", "Mean difference", "Influence", "Std.Error", "Confidence Interval", "p-value")

get_column_means <- function(dframe, col_list){
	df = data.frame(Means=rowMeans(dframe[, col_list]))
	return(df[, 1])
}

get_complete_cases <- function(dframe, cols_a, cols_b){
	df = dframe[complete.cases(dframe[, c(cols_a, cols_b)]), c(cols_a, cols_b)]
	return(df)
}

get_influence <- function(mu_diff){
	if (mu_diff == 0) { return("(0)") } 
	else if (mu_diff < 0){ return("(-)") } 
    else { return("(+)") }
}

print_output <- function(vector_x, main_table){
	# cat(vector_x[length(vector_x)])
	last_col = length(vector_x)-1 
	if(vector_x[1] == "Type1"){
		proportion_summary <<- c(proportion_summary, vector_x[2:last_col])
	}
	if(vector_x[1] == "Type2"){
		mean_summary <<- c(mean_summary, vector_x[2:last_col])
	}
}

get_proportion_summary <- function(){
	cols = 5
	rows = length(proportion_summary)/cols
	summary_v = matrix(proportion_summary, nrow = rows,ncol = cols, byrow = TRUE) 
	return(as.data.frame(summary_v))
}

get_mean_summary <- function(){
	cols = 6
	rows= length(mean_summary)/cols
	summary_v = matrix(mean_summary, nrow = rows,ncol = cols, byrow = TRUE) 
	return(as.data.frame(summary_v))
}

print_summary <- function(print_str){
	# print("")
	# cat(print_str)
	# print("")
}