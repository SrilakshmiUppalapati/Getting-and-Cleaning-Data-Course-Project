# Getting-and-Cleaning-Data-Course-Project

The script analyzes the data from UCI HAR Dataset. The archive is extracted to the working directory.

The following files are used:

features.txt - includes the descriptions for features measured

train/X_train.txt - includes the measurements of the features in train set (one row - 1 measurement of 561 features)

test/X_test.txt - includes the measurements of the features in test set

train/subject_train.txt - subject for each measurement from the train set

test/subject_test.txt - subject for each measurement from the test set

train/y_train.txt - activity (from 1 to 6) for each measurement from the train set

test/y_test.txt - activity (from 1 to 6) for each measurement from the test set


How the script works

a. Loads all training data from files - Features, Activities and Subjects

b. Loads all test data from files - Features, Activities and Subjects

c. Loads all Features and Activity labels from files

d. Merges training and test data that are read above and set column names

e. Extract only the measurements on the mean and standard deviation for each measurement. Determines columns to keep and keep them

f. Appropriately label the merged data set with descriptive variable names. Ex: "Acc" to "Accelerometer"; "Gyro" to "Gyroscope" etc.

g. From the above data set, creates a second, independent tidy data set with the average/mean of each variable for each activity and each subject

h. Finally outputs the above mean value data set to a file "tidy_data.txt" with row.name=FALSE

