# You should create one R script called run_analysis.R that does the following. 
# 1. Merges the training and the test sets to create one data set.
# 2. Extracts only the measurements on the mean and standard deviation for each measurement. 
# 3. Uses descriptive activity names to name the activities in the data set
# 4. Appropriately labels the data set with descriptive variable names. 
# From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

## 1.Download the zipped data file and place it into the data folder 
if(!file.exists("./data")) {dir.create("./data")}
fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(fileUrl, destfile="./data/Dataset.zip", method="curl")

## 2.Unzip the file
unzip(zipfile="./data/Dataset.zip", exdir="./data")

## 3.Required files are in the folder `~\data\UCI HAR Dataset`, point to the necessary files. 
path_rf <- file.path("./data", "UCI HAR Dataset")
files <- list.files(path_rf, recursive=TRUE)

## 4.Read data from the files (Train & Test) into variables
### 4.1 Read the Activity files
dataActivityTrain <- read.table(file.path(path_rf, "train", "Y_train.txt"),header = FALSE)
dataActivityTest  <- read.table(file.path(path_rf, "test" , "Y_test.txt" ),header = FALSE)

### 4.2 Read the Subject files
dataSubjectTrain <- read.table(file.path(path_rf, "train", "subject_train.txt"), header = FALSE)
dataSubjectTest <- read.table(file.path(path_rf, "test", "subject_test.txt"), header = FALSE)

### 4.3 Read the Features files
dataFeaturesTrain <- read.table(file.path(path_rf, "train", "X_train.txt"), header = FALSE)
dataFeaturesTest <- read.table(file.path(path_rf, "test", "X_test.txt"), header = FALSE)

## 5.Merge the training and test sets to create one data set
### 5.1 Concatenate the data tables by rows
dataSubject <- rbind(dataSubjectTrain, dataSubjectTest)
dataFeatures <- rbind(dataFeaturesTrain, dataFeaturesTest)
dataActivity <- rbind(dataActivityTrain, dataActivityTest)

### 5.2 Set names to variables
names(dataSubject) <- c("subject")
names(dataActivity) <- c("activity")
dataFeaturesName <- read.table(file.path(path_rf, "features.txt"), header = FALSE)
names(dataFeatures) <- dataFeaturesName$V2

### 5.3 Merge columns to get the dataframe data for all data
dataCombine <- cbind(dataSubject, dataActivity)
Data <- cbind(dataFeatures, dataCombine)

## 6.Extracts only the measurements on the mean and standard deviation for each measurement
### 6.1 Subset Name of Features by measurements on the mean and standard deviation
subdataFeaturesNames <- dataFeaturesName$V2[grep("mean\\(\\)|std\\(\\)", dataFeaturesName$V2)]

### 6.2 Subset the dataframe Data by selected names of Features
selectedNames <- c(as.character(subdataFeaturesNames), "subject", "activity")
Data <- subset(Data, select = selectedNames)

## 7.Uses descriptive activity names to name the activities in the data set
### 7.1 Read descriptive activity names from "activity_labels.txt"
activityLabels <- read.table(file.path(path_rf, "activity_labels.txt"), header = FALSE)

### 7.2 Merge activity descriptive label into processed data
names(activityLabels) <- c("activity", "activityType")
Data2 <- merge(Data, activityLabels, by='activity')

## 8.Appropriately labels the data set with descriptive variable names
### 8.1 Rename the column name label using descriptive variable names
    #### prefix t is replaced by time
    #### prefix f is replaced by frequency
    #### Acc is replaced by Accelerometer
    #### Gyro is replaced by Gyroscope
    #### Mag is replaced by Magnitude
    #### BodyBody is replaced by Body
names(Data2) <- gsub("^t", "time", names(Data2))
names(Data2) <- gsub("^f", "frequency", names(Data2))
names(Data2) <- gsub("Acc", "Accelerometer", names(Data2))
names(Data2) <- gsub("Gyro", "Gyroscope", names(Data2))
names(Data2) <- gsub("Mag", "Magnitude", names(Data2))
names(Data2) <- gsub("BodyBody", "Body", names(Data2))

## 9.Create the tidydata set and output it
library(plyr)
Data3 <- aggregate(. ~subject + activityType, Data2, mean)
Data3 <- Data3[order(Data3$subject, Data3$activityType),]
Data3 <- subset(Data3, select = -activity)
write.table(Data3, file = "tidydata.txt", row.name = FALSE)
write.csv(Data3, file = "tidydata.csv", row.names = FALSE)
