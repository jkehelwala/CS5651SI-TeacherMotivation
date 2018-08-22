# Initial Analysis

dir.create(file.path("output/MeanSummary/"), showWarnings = FALSE)
mean_vals = c()
sd_vals = c()
counts = c()
max_vals = c()
min_vals = c()
column_names = colnames(q)

options(warn=-1)
for (i in 1:length(q)){
	vector_x = q[,i]
	col_name = column_names[i]
	# Distributions
	freqTbl = as.data.frame(table(vector_x, useNA = "ifany"))
	freqTbl = cbind(freqTbl, freqTbl$Freq/length(vector_x)*100) 
	write.table(rbind(c(""),c(col_name)), file =distribution_csv, sep = ",", row.names = FALSE, col.names = FALSE, append = "TRUE")
	write.table(freqTbl, file =distribution_csv, sep = ",", row.names = FALSE, col.names = c("Col", "Freq", "%"), append = "TRUE")
	# Descriptive Stats
	mean_vals = c(mean_vals, mean(vector_x, na.rm=TRUE))
	sd_vals = c(sd_vals, sd(vector_x, na.rm=TRUE))
	counts = c(counts, sum(!is.na(vector_x)))
	max_val = max(vector_x[!is.na(vector_x)])
	max_vals = c(max_vals, max_val)
	min_vals = c(min_vals, min(vector_x[!is.na(vector_x)]))
	# Histogram / BarChart
	png(paste("output/MeanSummary/", col_name, "_dist.png", sep=""))
	if(max_val>5) { hist(vector_x, main=col_name) } 
	else { barplot(table(vector_x), main=col_name, xlab="Values")	}
	dev.off()
}
options(warn=0)
analysis.df = data.frame(column_names, mean_vals, sd_vals, counts, min_vals, max_vals)

# General Averages
print_analysis(analysis.df)