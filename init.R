# setwd("D:/MSc\ Ongoing/SI\ Project/RScripts")
unlink("output", recursive=TRUE)
dir.create(file.path("output/"), showWarnings = FALSE)
dir.create(file.path("output/sout/"), showWarnings = FALSE)
q = read.csv(file = "data/QuestionnaireAnswers.csv", header=TRUE, sep=",")
# q = q[complete.cases(q[,colnames(q)]), colnames(q)]

summary_files = c("output/MeanSummary.csv", "output/SampleEvaluations.csv", "output/PairedHypothesisTests.csv", "output/HypothesisTests.csv")
distribution_csv = "output/ValueDistributions.csv"

source("scripts/functions/HelperFunctions.R")
source("scripts/functions/FuncProportionEval.R")
source("scripts/functions/FuncMeanComparison.R")
source("scripts/functions/FuncMeanEval.R")

source("scripts/ScriptMeans.R")
source("scripts/ScriptSampleEvaluation.R")
source("scripts/ScriptMotivationStudy.R")
source("scripts/ScriptGainStudy.R")

write.table(get_mean_analysis(), file = summary_files[1], sep = ",", row.names = FALSE, col.names = TRUE)
write.table(get_proportion_summary(), file = summary_files[2], sep = ",", row.names = FALSE, col.names = FALSE)
write.table(get_mean_summary(), file = summary_files[3], sep = ",", row.names = FALSE, col.names = FALSE)
write.table(get_single_mean_summary(), file = summary_files[4], sep = ",", row.names = FALSE, col.names = FALSE)

sink("output/CompleteSummary.csv")
for(i in 1:length(summary_files)){
	print_str = readChar(summary_files[i], file.info(summary_files[i])$size)
	cat(gsub("\r?\n|\r", "\n", print_str))
	cat("\n\n\n")
}
sink()

cat("\n\nScript Execution - Successful.\n")
