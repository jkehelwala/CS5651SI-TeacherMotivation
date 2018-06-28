# Initial Analysis

dir.create(file.path("output/MeanSummary/"), showWarnings = FALSE)
mean_vals = c()
sd_vals = c()
counts = c()
column_names = colnames(q)
for (i in 1:length(q)){
	mean_vals = c(mean_vals, mean(q[,i], na.rm=TRUE))
	sd_vals = c(sd_vals, sd(q[,i], na.rm=TRUE))
	counts = c(counts, sum(!is.na(q[,i])))
	png(paste("output/MeanSummary/", column_names[i], "_dist.png", sep=""))
	hist(q[,i], main=paste(column_names[i], "Distribution"))
	dev.off()
}
analysis.df = data.frame(column_names, mean_vals, sd_vals, counts)

# General Averages
file_n = "output/MeanSummary.csv"
write.table(analysis.df, file = file_n, sep = ",", row.names = FALSE, col.names = TRUE)
print_summary(analysis.df)