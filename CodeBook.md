**"Getting and Cleaning Data"** Course Project Code Book
========================================

## Initial data for research
The data is taken from [UCI HAR Dataset](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip). 
This dataset provide the following variables for each activity:
  1. *Subject* - ID of participant
  2. *Activity* - ID of activity type
  3. Mean and standart deviation for the following features (other values are presented in initial dataset, but for this reasearch only these parameters were used)
      * tBodyAcc-XYZ
      * tGravityAcc-XYZ
      * tBodyAccJerk-XYZ
      * tBodyGyro-XYZ
      * tBodyGyroJerk-XYZ
      * tBodyAccMag
      * tGravityAccMag
      * tBodyAccJerkMag
      * tBodyGyroMag
      * tBodyGyroJerkMag
      * fBodyAcc-XYZ
      * fBodyAccJerk-XYZ
      * fBodyGyro-XYZ
      * fBodyAccMag
      * fBodyAccJerkMag
      * fBodyGyroMag
      * fBodyGyroJerkMag

The features come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

## CodeBook

a. Loads all training data from files - Features, Activities and Subjects, using read.table command
b. Loads all test data from files - Features, Activities and Subjects, using read.table command
c. Loads all Features and Activity labels from files using read.table command
d. Merges training and test data that are read above using cbind and rbind commands and set column names 
e. Extract only the measurements on the mean and standard deviation for each measurement. Determines columns to keep and keep them
f. Appropriately label the merged data set with descriptive variable names using gsub command. Ex: Change "Acc" to "Accelerometer"; "Gyro" to "Gyroscope" etc.
g. From the above data set, creates a second, independent tidy data set with the average/mean of each variable for each activity and each subject using ddply command
h. Finally outputs the above mean value tidy data set to a file "tidy_data.txt" with row.name=FALSE
