##Code book

This is the code book for Getting and Clearing Data course's Course Project in Coursera.

The script "run_analysis.R" prepares tidy data by following steps;

0.Downloads the data from the web site

1.Merges the training and the test sets to create one data set.

2.Extracts only the measurements on the mean and standard deviation for each measurement.

3.Uses descriptive activity names to name the activities in the data set

4.Appropriately labels the data set with descriptive variable names.

5.From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.


Step0:
Downloads the data from the website("https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip") and unzip file, and set it as working directory.

Step1:
Merges files 3 kind and 2 variable files(ie, it merges X_train and x_test, y_train and y_test, train/subject_train and test/subjects_test) by using rbind()function.

Step2:
Extract certain data from merged data(made via step1), and rename general name using name() function.

Step3:
Change the names use descriptive activity names from other dataset("activity_label.txt") and rename data by uning name() function.

Step4:
Labels a data set and  merge 3 dataset(x_data, y_data and subject_data) by using cbind() function.

Step5:
Sets tidy dataset by using melt() and dcast() function.
Finally, by using write.table() function and prepares tidy data.
