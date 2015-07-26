# CodeBook

This code book describes the variables, the data, and any transformations or work that have been performed to clean up the data.

## Data Source

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data.

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain.

Reference: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

## Data Attribute Information

For each record in the dataset it is provided:
* Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.
* Triaxial Angular velocity from the gyroscope.
* A 561-feature vector with time and frequency domain variables.
* Its activity label.
* An identifier of the subject who carried out the experiment. 

Reference: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

## Content of the dataset

* 'README.txt'
* 'features_info.txt': Shows information about the variables used on the feature vector.
* 'features.txt': List of all features.
* 'activity_labels.txt': Links the class labels with their activity name.
* 'train/X_train.txt': Training set.
* 'train/y_train.txt': Training labels.
* 'test/X_test.txt': Test set.
* 'test/y_test.txt': Test labels.

The following files are available for the train and test data. Their descriptions are equivalent. 
* 'train/subject_train.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. 
* 'train/Inertial Signals/total_acc_x_train.txt': The acceleration signal from the smartphone accelerometer X axis in standard gravity units 'g'. Every row shows a 128 element vector. The same description applies for the 'total_acc_x_train.txt' and 'total_acc_z_train.txt' files for the Y and Z axis. 
* 'train/Inertial Signals/body_acc_x_train.txt': The body acceleration signal obtained by subtracting the gravity from the total acceleration. 
* 'train/Inertial Signals/body_gyro_x_train.txt': The angular velocity vector measured by the gyroscope for each window sample. The units are radians/second. 

## Transformation & Work Details Performed (```run_analysis.R```)

1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement. 
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names. 
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

## Script Flow (```run_analysis.R```)

1. (commented) Download the zipped data file and place it into the data folder 
2. (commented) Unzip the file 
3. Required files are in the folder `~\data\UCI HAR Dataset`, point to the necessary files. 
4. Read data from the files (Train & Test) into variables
	4.1 Read the Activity files
	4.2 Read the Subject files
	4.3 Read the Features files
5. Merge the training and test data sets to create one single data set
	5.1 Concatenate the data tables by rows
	5.2 Set names to variables
	5.3 Merge columns to get the dataframe data for all data
6. Extracts only the measurements on the mean and standard deviation for each measurement
	6.1 Subset Name of Features by measurements on the mean and standard deviation
	6.2 Subset the dataframe Data by selected names of features
7. Uses descriptive activity names to name the activities in the data set
	7.1 Read descriptive activity names from "activity_labels.txt"
	7.2 Merge activity descriptive label into processed data
8. Appropriately labels the data set with descriptive variable names
	8.1 Rename the column name label using descriptive variable names
9. Create the tidydata set and output it

## Details for Final Result - ```TidyData```

### ID Fields

* `subject` - The participant ("subject") ID
* `activityType` - The label of the activity performed when the corresponding measurements were taken
	* `WALKING` (value `1`)
	* `WALKING_UPSTAIRS` (value `2`)
	* `WALKING_DOWNSTAIRS` (value `3`)
	* `SITTING` (value `4`)
	* `STANDING` (value `5`)
	* `LAYING` (value `6`)

### Extracted Feature Fields (mean & std only)

* `timeBodyAccelerometer-mean()-X`
* `timeBodyAccelerometer-mean()-Y`
* `timeBodyAccelerometer-mean()-Z`
* `timeBodyAccelerometer-std()-X`
* `timeBodyAccelerometer-std()-Y`
* `timeBodyAccelerometer-std()-Z`
* `timeGravityAccelerometer-mean()-X`
* `timeGravityAccelerometer-mean()-Y`
* `timeGravityAccelerometer-mean()-Z`
* `timeGravityAccelerometer-std()-X`
* `timeGravityAccelerometer-std()-Y`
* `timeGravityAccelerometer-std()-Z`
* `timeBodyAccelerometerJerk-mean()-X`
* `timeBodyAccelerometerJerk-mean()-Y`
* `timeBodyAccelerometerJerk-mean()-Z`
* `timeBodyAccelerometerJerk-std()-X`
* `timeBodyAccelerometerJerk-std()-Y`
* `timeBodyAccelerometerJerk-std()-Z`
* `timeBodyGyroscope-mean()-X`
* `timeBodyGyroscope-mean()-Y`
* `timeBodyGyroscope-mean()-Z`
* `timeBodyGyroscope-std()-X`
* `timeBodyGyroscope-std()-Y`
* `timeBodyGyroscope-std()-Z`
* `timeBodyGyroscopeJerk-mean()-X`
* `timeBodyGyroscopeJerk-mean()-Y`
* `timeBodyGyroscopeJerk-mean()-Z`
* `timeBodyGyroscopeJerk-std()-X`
* `timeBodyGyroscopeJerk-std()-Y`
* `timeBodyGyroscopeJerk-std()-Z`
* `timeBodyAccelerometerMagnitude-mean()`
* `timeBodyAccelerometerMagnitude-std()`
* `timeGravityAccelerometerMagnitude-mean()`
* `timeGravityAccelerometerMagnitude-std()`
* `timeBodyAccelerometerJerkMagnitude-mean()`
* `timeBodyAccelerometerJerkMagnitude-std()`
* `timeBodyGyroscopeMagnitude-mean()`
* `timeBodyGyroscopeMagnitude-std()`
* `timeBodyGyroscopeJerkMagnitude-mean()`
* `timeBodyGyroscopeJerkMagnitude-std()`
* `frequencyBodyAccelerometer-mean()-X`
* `frequencyBodyAccelerometer-mean()-Y`
* `frequencyBodyAccelerometer-mean()-Z`
* `frequencyBodyAccelerometer-std()-X`
* `frequencyBodyAccelerometer-std()-Y`
* `frequencyBodyAccelerometer-std()-Z`
* `frequencyBodyAccelerometerJerk-mean()-X`
* `frequencyBodyAccelerometerJerk-mean()-Y`
* `frequencyBodyAccelerometerJerk-mean()-Z`
* `frequencyBodyAccelerometerJerk-std()-X`
* `frequencyBodyAccelerometerJerk-std()-Y`
* `frequencyBodyAccelerometerJerk-std()-Z`
* `frequencyBodyGyroscope-mean()-X`
* `frequencyBodyGyroscope-mean()-Y`
* `frequencyBodyGyroscope-mean()-Z`
* `frequencyBodyGyroscope-std()-X`
* `frequencyBodyGyroscope-std()-Y`
* `frequencyBodyGyroscope-std()-Z`
* `frequencyBodyAccelerometerMagnitude-mean()`
* `frequencyBodyAccelerometerMagnitude-std()`
* `frequencyBodyBodyAccelerometerJerkMagnitude-mean()` 
* `frequencyBodyBodyAccelerometerJerkMagnitude-std()`
* `frequencyBodyBodyGyroscopeMagnitude-mean()`
* `frequencyBodyBodyGyroscopeMagnitude-std()`
* `frequencyBodyBodyGyroscopeJerkMagnitude-mean()`
* `frequencyBodyBodyGyroscopeJerkMagnitude-std()`




