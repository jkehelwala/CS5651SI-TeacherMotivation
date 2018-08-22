# Paired difference in means
# Arguments - title vector_a vector_b  test
# Null hypothesis; mu_diff = 0
# Alternate; mu_diff != 0

mean_comparison <- function(output_file, vector_a, vector_b, alternative) {

	title = gsub("_", " ", output_file)
	output_file_txt = paste("output/sout/", output_file, ".txt", sep="")
	sink(file = output_file_txt)
	cat("\n", title, "\n-----------------------------")
				
	mu = 0
	sample_size = length(vector_a)
	output = t.test(vector_a, vector_b, paired=TRUE, alternative=alternative)
	print(output)

	sink()

	mu_diff = output$estimate[[1]]
	p_value = output$p.value
	ci_low = output$conf.int[1]
	ci_high = output$conf.int[2]
	tstatistic = output$statistic[[1]]
	degrees_of_freedom = output$parameter[[1]]
	htest = output$alternative
	
	print_str = readChar(output_file_txt, file.info(output_file_txt)$size)
	# mean_props = c("Type", "Test", "Mean difference", "T-statistic", "CI Low", "CI High", "p-value", "df", "htest")
	mean_props = c("Type2", title, mu_diff, tstatistic, ci_low, ci_high, 
		format(p_value, scientific = FALSE), degrees_of_freedom, htest)
	return(c(mean_props, print_str))
}

