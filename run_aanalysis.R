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




