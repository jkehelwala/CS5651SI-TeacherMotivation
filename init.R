# setwd("D:/MSc\ Ongoing/SI\ Project/RScripts")
q = read.csv(file = "data/QuestionnaireAnswers.csv", header=TRUE, sep=",")
source("scripts/functions/HelperFunctions.R")
source("scripts/functions/FuncProportionEval.R")
source("scripts/functions/FuncMeanComparison.R")

# Initial Analysis
source("scripts/ScriptMeans.R")

source("scripts/ScriptValidateSample.R")
source("scripts/ScriptMotivationStudy.R")

write.table(get_proportion_summary(), file = "output/proportions.csv", sep = ",", row.names = FALSE, col.names = FALSE)
write.table(get_mean_summary(), file = "output/mean_diffs.csv", sep = ",", row.names = FALSE, col.names = FALSE)

print("Script Successfully Executed.")