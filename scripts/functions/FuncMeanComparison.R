# One tailed test for difference in means
# Arguments - title vector_a vector_b 
# Null hypothesis; mu(vector_a) = mu(vector_b)
# Alternate; mu(vector_a) != mu(vector_b) 

mean_comparison <- function(output_file, vector_a, vector_b, lower_tail) {

	title = gsub("_", " ", output_file)
	dir.create(file.path("output/", output_file), showWarnings = FALSE)
	output_file_txt = paste("output/", output_file, "/output.txt", sep="")
	sink(file = output_file_txt)
	cat("\n----------------------------------------------------------------")
	cat("\nTest Mean Difference: ", title)
	cat("\n----------------------------------------------------------------")

	h0_mu_diff = 0				
	sim_sample_size = 1000			
	with_replacement = TRUE 	
	ci_left_precentage = 0.025	
	ci_right_precentage = 0.975	

	sample_size = length(vector_a)
	mu_diff = mean(vector_a) - mean(vector_b)
	cat("\n","Sample Size :", sample_size)
	cat("\n","Lower Tail :", lower_tail)
	cat("\n","Mean difference :", mu_diff)
	cat("\n","Influence :", get_influence(mu_diff))

	# Bootstrap for Confidence Intervals
	cat("\n\n-----Confidence Interval-----")
	bs_mean_differences = c()
	for (i in 1:sim_sample_size){
		sample_a <- sample(vector_a, sample_size, replace=TRUE)
		sample_b <- sample(vector_b, sample_size, replace=TRUE)
		bs_mean_differences <- c(bs_mean_differences, mean(sample_a) - mean(sample_b))
	}
	png(paste("output/", output_file, "/bs_dist.png", sep=""))
	hist(bs_mean_differences, main=paste(title, "- Bootstraped"))
	dev.off()


	bs_mean = mean(bs_mean_differences)
	bs_standard_dev = sd(bs_mean_differences)
	bs_standard_error = bs_standard_dev
	cat("\n","Bootstrap Mean :", bs_standard_error)
	cat("\n","Bootstrap Std.Dev :", bs_standard_error)
	cat("\n","Bootstrap Std.Error :", bs_standard_error)

	ci_interval_v = qnorm(c(ci_left_precentage, ci_right_precentage), mean=mu_diff, sd=bs_standard_error)
	ci_interval = paste("[",  round(ci_interval_v[1], digits = 6) , "," , round(ci_interval_v[2], digits = 6), "]")

	cat("\n","Confidence Interval :", ci_interval)

	# End of Bootstrap for Confidence Intervals

	# Randomization distribution for p-value, under H0
	cat("\n\n----- p-value -----")

	adjustment = 0 - mu_diff
	vector_diff = vector_a - vector_b

	altered_means = c()
	for(i in 1:length(vector_diff)){
		altered_means = c(altered_means, vector_diff[i] + adjustment)
	}
	# cat("\n","Altered Means :\n")
	# print(altered_means)
	cat("\n","Mean of altered means:", round(mean(altered_means), digits = 2))

	rand_mean_differences = c()
	sampleM = altered_means
	for (i in 1:sim_sample_size){
		rand_mean_differences = c(rand_mean_differences, mean(sampleM))
		sampleM = sample(altered_means, replace=TRUE)
	}
	png(paste("output/", output_file, "/rand_dist.png", sep=""))
	hist(rand_mean_differences, main=paste(title, "- Randomization"))
	dev.off()

	rd_mean = mean(rand_mean_differences)
	rd_standard_dev = sd(rand_mean_differences)
	cat("\n","Randomization Mean :", rd_mean)
	cat("\n","Randomization Std.Dev :", rd_standard_dev)

	p_value = pnorm(mu_diff, mean=h0_mu_diff, sd=rd_standard_dev, lower.tail = lower_tail)
	cat("\n","p-value :", p_value)
	cat("\n")

	sink()
	
	print_str = readChar(output_file_txt, file.info(output_file_txt)$size)
	# mean_props = c("Type","Test", "Mean difference", "Influence", "Std.Error", "Confidence Interval", "p-value", "filestr")
	mean_props = c("Type2", title, mu_diff, get_influence(mu_diff), bs_standard_error, ci_interval, format(p_value, scientific = FALSE), print_str)
	return(mean_props)
}

