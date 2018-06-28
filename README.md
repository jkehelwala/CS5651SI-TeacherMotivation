# CS5651SI Project - TeacherMotivation

## Build Instructions

1) Clone the repository and navigate inside 
2) Inspect **output_ref** folder for a **Sample Output for finalized code** 
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
├───output_ref                          # Sample Output
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
└───scripts                             # R Scripts to be invoked by "init" script
    └───functions                           # Functions for Confidence Interval and Hypothesis Testing
~~~~~~~~
