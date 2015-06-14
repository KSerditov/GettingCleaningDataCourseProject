# This script assumes there is unzipped
# folder "UCI HAR Dataset" located in your working directory.

# Load test data files.
testRawData <- read.table("./UCI HAR Dataset/test/X_test.txt", header = FALSE)
testRawLabels <- read.table("./UCI HAR Dataset/test/y_test.txt", header = FALSE)
testRawSubjects <- read.table("./UCI HAR Dataset/test/subject_test.txt", header = FALSE)

# Load train data files.
trainRawData <- read.table("./UCI HAR Dataset/train/X_train.txt", header = FALSE)
trainRawLabels <- read.table("./UCI HAR Dataset/train/y_train.txt", header = FALSE)
trainRawSubjects <- read.table("./UCI HAR Dataset/train/subject_train.txt", header = FALSE)

# Load features and labels.
features <- read.table("./UCI HAR Dataset/features.txt", header=FALSE)
labels <- read.table("./UCI HAR Dataset/activity_labels.txt", header=FALSE)
colnames(labels)[1] <- "labels"
colnames(labels)[2] <- "activity"

# Append Labels and Subjects columns to the datasets.
trainData <- cbind(trainRawLabels, trainRawSubjects, trainRawData)
colnames(trainData)[1] <- "labels"
colnames(trainData)[2] <- "subjects"

testData <- cbind(testRawLabels, testRawSubjects, testRawData)
colnames(testData)[1] <- "labels"
colnames(testData)[2] <- "subjects"

# Step 1. Merge the training and the test sets to create one data set.
data <- rbind(trainData, testData)

# Step 2. Extracts only the measurements on the mean and 
#         standard deviation for each measurement.
# Find columns with mean() or std() in name.
outColumns <- subset(features,grepl("mean[(]|std[(]",features[,2]))
outColumns$V1 <- outColumns$V1 + 2 # because of already appended labels and subjects

# Select required columns from the unioned dataset.
selectedData <- data[, c(1,2,outColumns$V1)]

# Step 3. Append activity names
mergedData <- merge(labels, selectedData, by = "labels")
# Drop label id column since we now have descriptive activity name
mergedData <- mergedData[,-1] 

# Step 4. Set column names
resultNames <- c("activity", "subject", as.character(outColumns[,2]))
colnames(mergedData) <- resultNames

# Step 5. From the data set in step 4, creates a second, 
# independent tidy data set with the average of each variable 
# for each activity and each subject.
tidySet <- aggregate(mergedData[-c(1,2)], by=mergedData[,1:2], FUN="mean")

# Write result as .txt file for submission
write.table(tidySet, file="./step_5_tidy_set.txt", row.name=FALSE)
