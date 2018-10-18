#0. Prepareation and get the Data
packages <- c("data.table", "reshape2")
sapply(packages, require, character.only=TRUE, quietly=TRUE)
url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(url, file.path("./data", "dataFiles.zip"))
unzip(zipfile = "dataFiles.zip")
setwd("C:/Users/Marina/Documents/UCI HAR Dataset")

#1. Merges the training and the test sets to create one data set.
X_train <- read.table("train/X_train.txt")
y_train <- read.table("train/y_train.txt")
subject_train <- read.table("train/subject_train.txt")

x_test <- read.table("test/X_test.txt")
y_test <- read.table("test/y_test.txt")
subject_test <- read.table("test/subject_test.txt")

x_data <- rbind(X_train,x_test)
y_data <- rbind(y_train, y_test)
subject_data <- rbind(subject_train, subject_test)

#2.Extracts only the measurements on the mean and standard deviation for each measurement.
features <- read.table("features.txt")
mean_and_sd_features <- grep("-(mean|std)\\(\\)", features[, 2])

x_data <- x_data[, mean_and_sd_features]
names(x_data) <- features[mean_and_sd_features, 2]

#3. Use descriptive activity names to name the activities in the data set.
activities <- read.table("activity_labels.txt")

y_data[, 1] <- activities[y_data[, 1], 2]
names(y_data) <- "activity"

#4.Appropriately labels the data set with descriptive variable names.
names(subject_data) <- "subject"
all_data <- cbind(x_data, y_data, subject_data)

#5.From the data set in step4, creates a second, independent 
#tidy data set with the average of each variable for each activity and each subject.
all_data$activity <- factor(all_data$activity, levels = activities[,1], labels = activities[,2])
all_data$subject <- as.factor(all_data$subject)

all_data_melted <- melt(all_data, id = c("subject", "activity"))
all_data_mean <- dcast(all_data_melted, subject + activity ~ variable, mean)

write.table(all_data_mean, "tidy.txt", row.names = FALSE, quote = FALSE)