 fileName <- "Final_Project.zip"    #download the file
  if (!file.exists(fileName)) {
  fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
  download.file(fileUrl, fileName)
}

if (!file.exists("UCI HAR Dataset")) {
   unzip(fileName)                   #Unzip the file
}
 ### Create the frames
 features <- read.table("UCI HAR Dataset/features.txt", col.names = c("n","functions"))
 activities <- read.table("UCI HAR Dataset/activity_labels.txt", col.names = c("code", "activity"))
 s_test <- read.table("UCI HAR Dataset/test/subject_test.txt", col.names = "subject")
 x_test <- read.table("UCI HAR Dataset/test/X_test.txt", col.names = features$functions)
 y_test <- read.table("UCI HAR Dataset/test/y_test.txt", col.names = "code")
 s_train <- read.table("UCI HAR Dataset/train/subject_train.txt", col.names = "subject")
 x_train <- read.table("UCI HAR Dataset/train/X_train.txt", col.names = features$functions)
 y_train <- read.table("UCI HAR Dataset/train/y_train.txt", col.names = "code")
 
#Step1
X <- rbind(x_train, x_test)
Y <- rbind(y_train, y_test)
S <- rbind(subject_train, subject_test)
Merged_Data <- cbind(S, Y, X)

#Step2

TidyData <- Merged_Data %>% select(S, code, contains("mean"), contains("std"))

#step3
TidyData$code <- activities[TidyData$code, 2]

#Step4

names(TidyData)[2] = "activity"
names(TidyData) <- gsub("Acc", "Accelerometer", names(TidyData))
names(TidyData) <- gsub("Gyro", "Gyroscope", names(TidyData))
names(TidyData) <- gsub("BodyBody", "Body", names(TidyData))
names(TidyData) <- gsub("Mag", "Magnitude", names(TidyData))
names(TidyData) <- gsub("^t", "Time", names(TidyData))
names(TidyData) <- gsub("^f", "Frequency", names(TidyData))
names(TidyData) <- gsub("tBody", "TimeBody", names(TidyData))
names(TidyData) <- gsub("-mean()", "Mean", names(TidyData), ignore.case = TRUE)
names(TidyData) <- gsub("-std()", "STD", names(TidyData), ignore.case = TRUE)
names(TidyData) <- gsub("-freq()", "Frequency", names(TidyData), ignore.case = TRUE)
names(TidyData) <- gsub("angle", "Angle", names(TidyData))
names(TidyData) <- gsub("gravity", "Gravity", names(TidyData))

#Step5

FinalData <- TidyData %>%
+  group_by(S, activity) %>%
+  summarise_all(funs(mean))
write.table(FinalData, "FinalData.txt", row.name=FALSE)
