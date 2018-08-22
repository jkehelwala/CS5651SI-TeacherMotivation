# CS5651SI Project - Study of factors contributing to Teacher Motivation

This study aims to measure the postive, negative or neutral effects of student participation, student backgrounds, parent involvement, salary, vacation-time,teacher training and administrative interference on teacher motivation. A wide range of data representing each of the above factors were collected, and confidence interval evaluations and hypotheses tests were conducted to facilitate a comprehensive analysis.

## Mapping of important folders

| Folder        | Content           								|
| ------------- |---------------------------------------------------|
| questionnaire | Questionnaires    								|
| output_ref    | Outcomes/Figures  								|
| data          | Responses         								|
| scripts       | R Functions for CI and p-value calculations       |

## Execution Instructions

1) Clone the repository and navigate inside 
2) Inspect _output_ref_ folder for a _Sample Output for finalized code_
3) Run the following command to generate the reports

```bash
Rscript init.R
```
4) Go to the generated output/ folder
    1) Inspect the CompleteSummary.csv files for a concatanated summary of tests
    2) Inspect the MeanSummary/ folder to view histograms of parameters

## Directory Structure

~~~~~~~~

CS5651SI-TeacherMotivation
│   init.R                              # Main script		
├───data                                # Collected and Processed Data
│       QuestionnaireAnswers.csv            # Normalized CSV from original spreadsheet
│       SIQuestionnaireAnswers.ods          # Original Spreadsheet
├───output_ref                          # Outcomes/Figures; Sample Output for finalized code
│   │   CompleteSummary.csv                 # Aggregate CSV file 
│   │   Evaluations.csv                     
│   │   MeanSummary.csv                     
│   │   Tests.csv
│   │   TestsSingleMean.csv
│   ├───<Test Folders>*                 # Folders created by various tests
│   │       bs_dist.png                     # Histogram of Boostrap Distribution
│   │       output.txt                      # Summary of important values
│   │       rand_dist.png                   # Hisogram of Randomization Distribution
│   └───MeanSummary                     # Histograms for each collected parameter
├───questionnaire                       # Quesionnaire PDFs in two languages
│       questionnaire_english.pdf
│       questionnaire_sinhala.pdf
└───scripts                             # R scripts used for analysis (called through init.R)
    └───functions                           # R Functions for Confidence Interval and Hypothesis Testing
~~~~~~~~
<!---
## Summary Output

![Visual Summary of tests](output_ref/VisualSummary.png?raw=true "Visual Summary of tests")
-->