# One tailed test for a single proportion
# Arguments - title mean_sample lower_tail  
# Null hypothesis; mu(fact) = 3
# Alternate; mu(fact) != 3 


single_mean_eval <- function(output_file, vector_x, alternative) {

	vector_mean = vector_x[!is.na(vector_x)]
	title = gsub("_", " ", output_file)
	output_file_txt = paste("output/sout/", output_file, ".txt", sep="")
	sink(file = output_file_txt)
	cat("\n", title, "\n-----------------------------")

	mu = 3
	sample_size = length(vector_mean)
	output = t.test(vector_mean, mu=mu, alternative=alternative)
	print(output)

	sink()

	sample_mean = output$estimate[[1]]
	p_value = output$p.value
	ci_low = output$conf.int[1]
	ci_high = output$conf.int[2]
	tstatistic = output$statistic[[1]]
	degrees_of_freedom = output$parameter[[1]]
	htest = output$alternative

	print_str = readChar(output_file_txt, file.info(output_file_txt)$size)
	# single_mean_props = c("Type", "Test", "Mean", "T-statistic", "CI Low", "CI High", "p-value", "df", "htest")
	mean_props = c("Type3", title, sample_mean, tstatistic, ci_low, ci_high, 
		format(p_value, scientific = FALSE), degrees_of_freedom, htest)
	return(c(mean_props, print_str))
}