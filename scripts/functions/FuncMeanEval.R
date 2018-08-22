# One tailed test for a single proportion
# Arguments - title mean_sample lower_tail  
# Null hypothesis; mu(fact) = 3
# Alternate; mu(fact) != 3 


single_mean_eval <- function(output_file, vector_x, lower_tail) {

	vector_mean = vector_x[!is.na(vector_x)]
	title = gsub("_", " ", output_file)
	dir.create(file.path("output/", output_file), showWarnings = FALSE)
	output_file_txt = paste("output/", output_file, "/output.txt", sep="")
	sink(file = output_file_txt)
	cat("\n----------------------------------------------------------------")
	cat("\nTest Single Mean: ", title)
	cat("\n----------------------------------------------------------------")

	h0_mean = 3		
	sim_sample_size = 1000		
	with_replacement = TRUE 	
	ci_left_precentage = 0.025	
	ci_right_precentage = 0.975	

	sample_mean = mean(vector_mean)
	sample_size = length(vector_mean)
	adjustment = h0_mean - sample_mean # To use	
	cat("\n","Lower Tail :", lower_tail)
	cat("\n","Sample Size :", sample_size)
	cat("\n","Smple Mean :", sample_mean)

	influence = "(-)"
	if (sample_mean == h0_mean) { influence = "(0)" } 
	if (sample_mean > h0_mean){  influence = "(+)" } 
	cat("\n","Influence :", influence)

	# Bootstrap for Confidence Intervals
	cat("\n\n-----Confidence Interval-----")
	bs_means = c()
	for (i in 1:sim_sample_size){
		sample_r <- sample(vector_mean, sample_size, replace=TRUE)
		bs_means <- c(bs_means, mean(sample_r))
	}

	png(paste("output/", output_file, "/bs_dist.png", sep=""))
	hist(bs_means, main=paste(title, "- Bootstraped"))
	dev.off()

	bs_mean = mean(bs_means)
	bs_standard_dev = sd(bs_means)
	bs_standard_error = bs_standard_dev
	cat("\n","Bootstrap Mean :", bs_standard_error)
	cat("\n","Bootstrap Std.Dev :", bs_standard_error)
	cat("\n","Bootstrap Std.Error :", bs_standard_error)

	ci_interval_v = qnorm(c(ci_left_precentage, ci_right_precentage), mean=sample_mean, sd=bs_standard_error)
	ci_low = round(ci_interval_v[1], digits = 6)
	ci_high = round(ci_interval_v[2], digits = 6)
	ci_interval = paste("[",  ci_low , "," , ci_high, "]")

	cat("\n","Confidence Interval :", ci_interval)

	# End of Bootstrap for Confidence Intervals

	# Randomization distribution for p-value, under H0
	cat("\n\n----- p-value -----")

	normalized_sample = c()
	for(i in 1:sample_size){
	    normalized_sample = c(normalized_sample, vector_mean[i] + adjustment)
	}
	cat("\n","Adjusted Mean :", mean(normalized_sample)) # H0 Mean

	rand_means = c()
	for (i in 1:sim_sample_size){
		sample_r <- sample(normalized_sample, sample_size, replace=with_replacement)
    	rand_means = c(rand_means, mean(sample_r))
	}
	png(paste("output/", output_file, "/rand_dist.png", sep=""))
	hist(rand_means, main=paste(title, "- Randomization"))
	dev.off()

	rd_mean = mean(rand_means)
	rd_standard_dev = sd(rand_means)
	cat("\n","Randomization Mean :", rd_mean)
	cat("\n","Randomization Std.Dev :", rd_standard_dev)

	p_value = pnorm(sample_mean, mean=h0_mean, sd=rd_standard_dev, lower.tail = lower_tail)
	cat("\n","p-value :", p_value)
	cat("\n")

	sink()

	print_str = readChar(output_file_txt, file.info(output_file_txt)$size)
	# single_mean_props = c("Type", "Test", "Mean", "Influence", "Std.Error", "CI Low", "CI High", "p-value", "sample_size", "filestr")
	mean_props = c("Type3", title, sample_mean, influence, bs_standard_error, ci_low, ci_high, format(p_value, scientific = FALSE), sample_size, print_str)
	return(mean_props)
}