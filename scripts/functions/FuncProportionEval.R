# One tailed test for a single proportion
# Arguments - title probability lower_tail  
# Null hypothesis; p(fact) = 0.5
# Alternate; p(fact) != 0.5 

proportion_eval <- function(output_file, vector_x, lower_tail) {

	vector_prop = vector_x[!is.na(vector_x)]
	title = gsub("_", " ", output_file)
	dir.create(file.path("output/", output_file), showWarnings = FALSE)
	output_file_txt = paste("output/", output_file, "/output.txt", sep="")
	sink(file = output_file_txt)
	cat("\n----------------------------------------------------------------")
	cat("\nTest Proportion : ", title)
	cat("\n----------------------------------------------------------------")

	h0_proportion = 0.5				
	sim_sample_size = 1000		
	with_replacement = TRUE 	
	ci_left_precentage = 0.025	
	ci_right_precentage = 0.975	

	known_proportion = mean(vector_prop)
	sample_size = length(vector_prop)	
	cat("\n","Lower Tail :", lower_tail)
	cat("\n","Sample Size :", sample_size)
	cat("\n","Proportion :", known_proportion)

	# Bootstrap for Confidence Intervals
	cat("\n\n-----Confidence Interval-----")
	bs_proportions = c()
	for (i in 1:sim_sample_size){
		sample_r <- sample(vector_prop, sample_size, replace=TRUE)
		bs_proportions <- c(bs_proportions, mean(sample_r))
	}

	png(paste("output/", output_file, "/bs_dist.png", sep=""))
	hist(bs_proportions, main=paste(title, "- Bootstraped"))
	dev.off()

	bs_mean = mean(bs_proportions)
	bs_standard_dev = sd(bs_proportions)
	bs_standard_error = bs_standard_dev
	cat("\n","Bootstrap Mean :", bs_standard_error)
	cat("\n","Bootstrap Std.Dev :", bs_standard_error)
	cat("\n","Bootstrap Std.Error :", bs_standard_error)

	ci_interval_v = qnorm(c(ci_left_precentage, ci_right_precentage), mean=known_proportion, sd=bs_standard_error)
	ci_interval = paste("[",  round(ci_interval_v[1], digits = 6) , "," , round(ci_interval_v[2], digits = 6), "]")

	cat("\n","Confidence Interval :", ci_interval)

	# End of Bootstrap for Confidence Intervals

	# Randomization distribution for p-value, under H0
	cat("\n\n----- p-value -----")

	rand_proportions = c()
	for (i in 1:sim_sample_size){
		sample_r = rbinom(sample_size, 1, prob=h0_proportion)
    	rand_proportions = c(rand_proportions, mean(sample_r))
	}
	png(paste("output/", output_file, "/rand_dist.png", sep=""))
	hist(rand_proportions, main=paste(title, "- Randomization"))
	dev.off()

	rd_mean = mean(rand_proportions)
	rd_standard_dev = sd(rand_proportions)
	cat("\n","Randomization Mean :", rd_mean)
	cat("\n","Randomization Std.Dev :", rd_standard_dev)

	p_value = pnorm(known_proportion, mean=h0_proportion, sd=rd_standard_dev, lower.tail = lower_tail)
	cat("\n","p-value :", p_value)
	cat("\n")

	sink()

	print_str = readChar(output_file_txt, file.info(output_file_txt)$size)
	# proportion_props = c("Type", "Test", "Proportion", "Std.Error", "Confidence Interval", "p-value", "filestr")
	proportion_props = c("Type1", title, known_proportion, bs_standard_error, ci_interval, format(p_value, scientific = FALSE), print_str)
	return(proportion_props)
}
