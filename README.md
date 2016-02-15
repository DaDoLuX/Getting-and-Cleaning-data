# Assignment: Getting and Cleaning Data Course Project

## Purpose 
The purpose of this project is to demonstrate my ability to collect, work with, and clean a data set.

1. The submitted data set is tidy.
2. The Github repo contains the required scripts.
3. GitHub contains a code book that indicate all the variables and summaries calculated, along with units, and any other relevant information.

## To-Do
1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement.
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names.
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

## Execution of run_analysis.R
1. Sets directory where you keep your data set
2. Reads Train and Test sets about "Sets", "Labels" and "Subjects" and merge them.
3. Extracts mean and standard deviation from feature data set.
4. Cleane the column name and combine it with the "Combine_Set"
5. Read Activity data set and remove underscores and transform it to lower case.
6. Merge data sets "Mean_Combine_Set", "Combine_Subject" and "Combine_Labels" and print them in the file "merge.txt".
7. Calculate the mean of the activities and print them in "average.txt" file.