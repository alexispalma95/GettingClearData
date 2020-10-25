I've create the run_analysis.R and the program contains the language with 5 steps

# 1.- Download the dataset
you must download the zip file and extract and we called UCI HAR Dataset

# 2.- Assign variables
features <- features.txt : 561 rows, 2 columns
The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ.
activities <- activity_labels.txt : 6 rows, 2 columns
List of activities performed when the corresponding measurements were taken and its codes (labels)
subject_test <- test/subject_test.txt : 2947 rows, 1 column
contains test data of 9/30 volunteer test subjects being observed
x_test <- test/X_test.txt : 2947 rows, 561 columns
contains recorded features test data
y_test <- test/y_test.txt : 2947 rows, 1 columns
contains test data of activities’code labels
subject_train <- test/subject_train.txt : 7352 rows, 1 column
contains train data of 21/30 volunteer subjects being observed
x_train <- test/X_train.txt : 7352 rows, 561 columns
contains recorded features train data
y_train <- test/y_train.txt : 7352 rows, 1 columns
contains train data of activities’code labels

# 3.- Merge train and test for one dataset
Using rbind() create a variable called X where you merge x_train and x_test with 10299 rows and 51 columns
Using rbind() create a variable called Y where you merge y_train and y_test with 10299 rows and 1 column
S it's a variable created using rbind() and merging subject_train and subject_test with 10299 rows and 1 column
the variable Merged_Data, which contains 10299 rows and 563 columns have merged S, Y and X. the variables were used with cbind()

# 4.- Extracting the measurements of the mean and standard desviation
We call TidyData by subset Merged_Data. Only we must select the columns subject, code and the measurements on the mean and standard desviation

# 5.-  Using descriptive activity names to mention the activites in the dataset
Entire numbers in code column of the TidyData replaced with corresponding activity taken from second column of the activities variable

# 6.- Appropriately labels the data set with descriptive variable names
code column in TidyData renamed into activities
All Acc in column’s name replaced by Accelerometer
All Gyro in column’s name replaced by Gyroscope
All BodyBody in column’s name replaced by Body
All Mag in column’s name replaced by Magnitude
All start with character f in column’s name replaced by Frequency
All start with character t in column’s name replaced by Time

# 7.- From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject
FinalData (180 rows, 88 columns) is created by sumarizing TidyData taking the means of each variable for each activity and each subject, after groupped by subject and activity.
Export FinalData into FinalData.txt file.
