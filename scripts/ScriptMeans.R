# Initial Analysis

mean_vals = c()
sd_vals = c()
counts = c()
for (i in 1:length(q)){
	mean_vals = c(mean_vals, mean(q[,i], na.rm=TRUE))
	sd_vals = c(sd_vals, sd(q[,i], na.rm=TRUE))
	counts = c(counts, sum(!is.na(q[,i])))
}
analysis.df = data.frame(colnames(q), mean_vals, sd_vals, counts)

# General Averages
sink(file = "output/AverageValues.txt")
cat("\n----------------------------------------------------------------")
cat("\nOverview : General Averages")
cat("\n----------------------------------------------------------------")
print(analysis.df)
sink()
print_str = readChar("output/AverageValues.txt", file.info("output/AverageValues.txt")$size)
print_summary(print_str)