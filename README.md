# Getting & Cleaning Data Assignment

## Pre-requisites
* plyr needs to be installed
* the data files have to downloaded in the "UCI HAR Dataset" folder

## Instruction
Run run_analysis.R which will output a tidy dataset in tidy.txt 

## Description of the data cleanup
We merge both the train & test dataset replace activity IDs by description, and only import measurements of means and standard deviation (if the column contains a mean() or std()).
Multiple measurements of a subject/activity pair are averaged.