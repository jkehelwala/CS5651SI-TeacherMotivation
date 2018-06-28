# setwd("D:/MSc\ Ongoing/SI\ Project/RScripts")
dir.create(file.path("output/"), showWarnings = FALSE)
q = read.csv(file = "data/QuestionnaireAnswers.csv", header=TRUE, sep=",")
source("scripts/functions/HelperFunctions.R")
source("scripts/functions/FuncProportionEval.R")
source("scripts/functions/FuncMeanComparison.R")
source("scripts/functions/FuncMeanEval.R")

source("scripts/ScriptMeans.R")
source("scripts/ScriptValidateSample.R")
source("scripts/ScriptMotivationStudy.R")
source("scripts/ScriptRespectStudy.R")

write.table(get_proportion_summary(), file = "output/Evaluations.csv", sep = ",", row.names = FALSE, col.names = FALSE)
write.table(get_mean_summary(), file = "output/Tests.csv", sep = ",", row.names = FALSE, col.names = FALSE)
write.table(get_single_mean_summary(), file = "output/TestsSingleMean.csv", sep = ",", row.names = FALSE, col.names = FALSE)

print("Script Successfully Executed.")