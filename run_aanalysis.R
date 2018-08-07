#reading features and activity data

features <- read.table("./UCI HAR Dataset/features.txt")

activity_labels <- read.table("./UCI HAR Dataset/activity_labels.txt")



#reading training data

X_train <- read.table("./UCI HAR Dataset/train/X_train.txt") #features data

colnames(X_train) <- features$V2 #descriptive column names for data (STEP 4)

y_train <- read.table("./UCI HAR Dataset/train/y_train.txt") #activity labels

train$activity <- y_train$V1

subject_train <- read.table("./UCI HAR Dataset/train/subject_train.txt") #subjects

train$subject <- factor(subject_train$V1)


#reading test data

X_test <- read.table("./UCI HAR Dataset/test/X_test.txt")

colnames(X_test) <- features$V2

y_test <- read.table("./UCI HAR Dataset/test/y_test.txt") 

test$activity <- y_test$V1

subject_test <- read.table("./UCI HAR Dataset/test/subject_test.txt")

test$subject <- factor(subject_test$V1)

# STEP #1 ******* Merge the training and the test sets to create one data set

dataset <- rbind(X_test, X_train) 

# STEP #2 ******* Extract only the measurements on the mean and standard deviation for each measurement

column.names <- colnames(dataset)

column.names.filtered <- grep("std\\(\\)|mean\\(\\)|activity|subject", column.names, value=TRUE)

dataset.filtered <- dataset[, column.names.filtered] 

# STEP #3 ******* Uses descriptive activity names to name the activities in the data set
# STEP #4 ******* Appropriately label the data set with descriptive variable names

dataset.filtered$activitylabel <- factor(dataset.filtered$activity, labels= c("WALKING", "WALKING_UPSTAIRS", "WALKING_DOWNSTAIRS", "SITTING", "STANDING", "LAYING"))


# STEP 5 ****** From the data set in step 4, create a second, independent tidy data set with the average of each variable for each activity and each subject

#creating a tidy dataset with mean values for each subject and activity

features.colnames = grep("std\\(\\)|mean\\(\\)", column.names, value=TRUE)

dataset.melt <-melt(dataset.filtered, id = c('activitylabel', 'subject'), measure.vars = features.colnames)

dataset.tidy <- dcast(dataset.melt, activitylabel + subject ~ variable, mean)
                                   
#creating a tidy dataset file  

write.table(dataset.tidy, file = "tidydataset.txt" row.names = FALSE)




