# Getting & Cleaning Data Assignment

## Pre-requisites
* plyr needs to be installed
* the data files have to downloaded in the "UCI HAR Dataset" folder

## Instruction
* Run run_analysis.R which will output a tidy dataset in tidy.txt 

## Description of the data cleanup
* activity_labels.txt is used to transform activity IDs from y_train.txt/y_test.txt into activity description
* subject_train.txt & subject_test.txt are merged together through rbind
* features.txt is read and we filter only the values that contain either mean() or std(). Features names are then lower-cased and any special character removed
* X_train.txt/X_test is then read and we take only the columns we need from last step
* At the end, we average multiple measurments over every subject/activity pair
