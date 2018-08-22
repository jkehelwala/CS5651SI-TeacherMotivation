# One tailed test for a single proportion
# Arguments - title cases lower_tail  
# Null hypothesis; p(fact) = 0.5
# Alternate; p(fact) != 0.5 

proportion_eval <- function(output_file, vector_x, alternative) {

	vector_prop = vector_x[!is.na(vector_x)]
	title = gsub("_", " ", output_file)
	output_file_txt = paste("output/sout/", output_file, ".txt", sep="")
	sink(file = output_file_txt)
	cat("\n", title, "\n-----------------------------")

	sample_size = length(vector_prop)
	output = binom.test(sum(vector_prop), n=sample_size, alternative=alternative)
	print(output)

	sink()

	known_proportion = output$estimate[[1]]
	p_value = output$p.value
	ci_low = output$conf.int[1]
	ci_high = output$conf.int[2]
	tstatistic = output$statistic[[1]]
	htest = output$alternative

	print_str = readChar(output_file_txt, file.info(output_file_txt)$size)
	# proportion_props = c("Type", "Test", "Proportion", "T-statistic", "CI Low", "CI High", "p-value", "sample_size", "htest")
	proportion_props = c("Type1", title, known_proportion, tstatistic, ci_low, ci_high, 
		format(p_value, scientific = FALSE), sample_size, htest)
	return(c(proportion_props, print_str))
}

