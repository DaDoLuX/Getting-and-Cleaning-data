directory <- "C://Users//Davide//Desktop//UCI HAR Dataset"
setwd(directory)

# 1) Merges the training and the test sets to create one data set.
Train_Set <- read.table("./train/X_train.txt")
Train_Labels <- read.table("./train/Y_train.txt")
Train_Subject <- read.table("./train/subject_train.txt")

Test_Set <- read.table("./test/X_test.txt")
Test_Labels <- read.table("./test/Y_test.txt")
Test_Subject <- read.table("./test/subject_test.txt")

Combine_Set <- rbind(Train_Set, Test_Set)
Combine_Labels <- rbind(Train_Labels, Test_Labels)
Combine_Subject <- rbind(Train_Subject, Test_Subject)

# 2) Extracts only the measurements on the mean and standard deviation for each measurement.
features <- read.table('./features.txt')
MeanStd <- grep("-mean\\(\\)|-std\\(\\)", features[, 2])
Mean_Combine_Set <- Combine_Set[, MeanStd]

names(Mean_Combine_Set) <- features[MeanStd, 2]
names(Mean_Combine_Set) <- tolower(names(Mean_Combine_Set)) 
names(Mean_Combine_Set) <- gsub("\\(|\\)", "", names(Mean_Combine_Set))

# 3) Uses descriptive activity names to name the activities in the data set
activity <- read.table("./activity_labels.txt")
activity[, 2] <- tolower(as.character(activity[, 2]))
activity[, 2] <- gsub("_", "", activity[, 2])

Combine_Labels[, 1] = activity[Combine_Labels[, 1], 2]
colnames(Combine_Labels) <- "activity"
colnames(Combine_Subject) <- "subject"

# 4) Appropriately labels the data set with descriptive variable names.
data <- cbind(Combine_Subject, Mean_Combine_Set, Combine_Labels)
str(data)
write.table(data, "./Assignment/merged.txt", row.names = F)

#5) From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
average.s <- aggregate(x=data, by=list(activities=data$activity, subj=data$subject), FUN=mean)
average.s <- average.s[, !(colnames(average.s) %in% c("subj", "activity"))]
str(average.s)
write.table(average.s, "./Assignment/average.txt", row.names = F)