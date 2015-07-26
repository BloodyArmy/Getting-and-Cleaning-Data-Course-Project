# README for Getting-and-Cleaning-Data-Course-Project
Coursera/Data Science/Getting and Cleaning Data Course Project

```
This repo hosts the course project's work for Coursera DataScience track's "Getting and Cleaning Data" course which will be peer assessed.
The purpose of this project is to demonstrate the ability to collect, work with, and clean a data set. The goal is to prepare a tidy data that can be used for later analysis.
```

## This file explains how the scripts in the repo work and how they are connected. 

### Data set description & source
* Full description of the datasets used in the project can be referenced [here](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones).
* Source of the datasets can be referenced [here](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip).
* Alternatively, refer ```CodeBook.md``` - it describes the variables, the data, and any transformation or work that have been performed to clean up the data. 

### Main script - ```run_analysis.R```

1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement. 
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names. 
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

### Execution and files

1. Download the project files into your local directory. 
2. Load the ```run_analysis.R``` in R/RStudio.
3. The required dataset can be found in `~/data/UCI HAR Dataset` project files directory.
```
Alternatively, you can remove the commented section (#1 & #2 only) in run_analysis.R to re-download and unzip fresh copy of data. 
1.Download the file and place the file in the data folder
2.Unzip the file
```
4. Execute the ```run_analysis.R```.
5. Two result files (same data but different format) will be created:
	- tidydata.txt > result that will be uploaded as per coursework requirement.
	- tidydata.csv > result in csv format for easier viewing. 