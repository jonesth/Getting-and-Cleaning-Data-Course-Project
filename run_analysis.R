# Step 0 - Load reshape2 package to use later

library(reshape2)

## Step 1 - Merges the training and the test data sets to create one data set

# download and unzip the dataset
filename <- "getdata_dataset.zip"
if (!file.exists(filename)){
        fileURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
        download.file(fileURL, filename, method="wininet")
}  
if (!file.exists("UCI HAR Dataset")) { 
        unzip(filename) 
}

# load activity labels and features
activityLabels <- read.table("UCI HAR Dataset/activity_labels.txt")
activityLabels[,2] <- as.character(activityLabels[,2])
features <- read.table("UCI HAR Dataset/features.txt")
features[,2] <- as.character(features[,2])

## Step 2 - Extracts only the measurements on the mean and standard deviation for each measurement.

# extract only the mean and standard deviation data
featuresWant <- grep(".*mean.*|.*std.*", features[,2])
featuresWant.names <- features[featuresWant,2]
featuresWant.names = gsub('-mean', 'Mean', featuresWant.names)
featuresWant.names = gsub('-std', 'Std', featuresWant.names)
featuresWant.names <- gsub('[-()]', '', featuresWant.names)

# load the newly assembled datasets
train <- read.table("UCI HAR Dataset/train/X_train.txt")[featuresWant]
trainActivities <- read.table("UCI HAR Dataset/train/Y_train.txt")
trainSubjects <- read.table("UCI HAR Dataset/train/subject_train.txt")
train <- cbind(trainSubjects, trainActivities, train)

test <- read.table("UCI HAR Dataset/test/X_test.txt")[featuresWant]
testActivities <- read.table("UCI HAR Dataset/test/Y_test.txt")
testSubjects <- read.table("UCI HAR Dataset/test/subject_test.txt")
test <- cbind(testSubjects, testActivities, test)

# merge the train and test datasets.  Add labels
allData <- rbind(train, test)
colnames(allData) <- c("subject", "activity", featuresWant.names)

## Step 3 - Use descriptive activity names to name the activities in the data set.
## Step 4 - Appropriately label the data set with descriptive activity names.

# transform activities and subjects into 'factors'
allData$activity <- factor(allData$activity, levels = activityLabels[,1], labels = activityLabels[,2])
allData$subject <- as.factor(allData$subject)

## Step 5 - From the data set in step 4, create a second, independent tidy data set with the average of each variable for each activity and each subject.

# create the tidy data set
allDataMelted <- melt(allData, id = c("subject", "activity"))
allDataMean <- dcast(allDataMelted, subject + activity ~ variable, mean)

write.table(allDataMean, "tidy.txt", row.names = FALSE, quote = FALSE)