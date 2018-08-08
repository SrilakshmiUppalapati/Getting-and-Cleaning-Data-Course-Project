#reading training data
features_train <- read.table("./UCI HAR Dataset/train/X_train.txt") #features data
activity_train <- read.table("./UCI HAR Dataset/train/y_train.txt") #activity labels
subject_train <- read.table("./UCI HAR Dataset/train/subject_train.txt") #subjects

#reading test data
features_test <- read.table("./UCI HAR Dataset/test/X_test.txt") #features data
activity_test <- read.table("./UCI HAR Dataset/test/y_test.txt") #activity labels
subject_test <- read.table("./UCI HAR Dataset/test/subject_test.txt") #subjects


#reading features and activity data

features <- read.table("./UCI HAR Dataset/features.txt", as.is=TRUE)
activity_labels <- read.table("./UCI HAR Dataset/activity_labels.txt")
colnames(activity_labels) <- c("activityId", "activityLabel") 

# STEP #1 ******* Merge the training and the test sets to create one data set

merged_dataset <- rbind(
  cbind(subject_train, features_train, activity_train),
  cbind(subject_test, features_test, activity_test)
) 
  # Set column names for merged data set
colnames(merged_dataset) <- c("subject", features[, 2], "activity")

# STEP #2 ******* Extract only the measurements on the mean and standard deviation for each measurement

  # determine columns of data set to keep based on column name...

columnsToKeep <- grepl("subject|activity|mean|std", colnames(merged_dataset))

# ... and keep data in these columns only

merged_dataset <- merged_dataset[, columnsToKeep]

# STEP #3 ******* Use descriptive activity names to name the activities in the data set

# replace activity values with named factor levels

merged_dataset$activity <- factor(merged_dataset$activity, 
levels = activities[, 1], labels = activities[, 2])

# STEP #4 ******* Appropriately label the data set with descriptive variable names

# get column names

merged_dataset_columns <- colnames(merged_dataset)

# remove special characters

merged_dataset_columns <- gsub("[\\(\\)-]", "", merged_dataset_columns)

# expand abbreviations and clean up names

merged_dataset_columns <- gsub("^f", "frequencyDomain", merged_dataset_columns)

merged_dataset_columns <- gsub("^t", "timeDomain", merged_dataset_columns)

merged_dataset_columns <- gsub("Acc", "Accelerometer", merged_dataset_columns)

merged_dataset_columns <- gsub("Gyro", "Gyroscope", merged_dataset_columns)

merged_dataset_columns <- gsub("Mag", "Magnitude", merged_dataset_columns)

merged_dataset_columns <- gsub("Freq", "Frequency", merged_dataset_columns)

merged_dataset_columns <- gsub("mean", "Mean", merged_dataset_columns)

merged_dataset_columns <- gsub("std", "StandardDeviation", merged_dataset_columns)

merged_dataset_columns <- gsub("BodyBody", "Body", merged_dataset_columns)

# use new labels as column names

colnames(merged_dataset) <- merged_dataset_columns


# STEP 5 ****** From the data set in step 4, create a second, independent tidy data set with the average of each variable for each activity and each subject

#creating a tidy dataset with mean values for each subject and activity

merged_dataset_means <- merged_dataset %>% 

  group_by(subject, activity) %>%

  summarise_each(funs(mean))

# output the above mean values data set to a file "tidy_data.txt"

write.table(merged_dataset_means, "tidy_data.txt", row.names = FALSE, quote = FALSE)




