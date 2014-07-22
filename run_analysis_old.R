# project for Getting and Cleaning Data 
# for Coursera Data Science Signature Track
# July 2014  Nicole Goebel

## 0. load data from zip file:
## https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
##   a. download file into directory
if (!file.exists("./Dataset.zip")){
    fileURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
    download.file(fileURL, destfile="Dataset.zip", method="curl")
    filelist <- list.files()
    print(filelist)
    dateDownloaded <- date()
    print(dateDownloaded)
} else {message("Dataset.zip already exists")}
##   b. unzip file
dataDir = "UCI HAR Dataset"
if (!file.exists(dataDir)) {
    unzip("Dataset.zip")
} else {message("samsung data directory and data already exist")}
## 1. Merge training and test sets to create one data set
##    a. list filenames
inertial_signals_train <- c("body_acc_x_train.txt", "body_acc_y_train.txt", "body_acc_z_train.txt", "body_gyro_x_train.txt", "body_gyro_y_train.txt", "body_gyro_z_train.txt", "total_acc_x_train.txt", "total_acc_y_train.txt", "total_acc_z_train.txt")
inertial_signals_test <- c("body_acc_x_test.txt", "body_acc_y_test.txt", "body_acc_z_test.txt", "body_gyro_x_test.txt", "body_gyro_y_test.txt", "body_gyro_z_test.txt", "total_acc_x_test.txt", "total_acc_y_test.txt", "total_acc_z_test.txt")

##   b. loading data
##      subject == person being measured
##      Y_test == activities performed in x_test 
##      (the contents of y_test matches activity labels)
##      as well as X and Y (of test and train), and activity labels,
##      you will need features.txt for the column labels and you
##      will want to draw on their description of the data for writing your codebook.

testX <- read.table("./UCI HAR Dataset/test/X_test.txt", header = FALSE)
###  testX has 561 columns. 561 feature vector with time and frequency domain variables. TRAINING SET
testY<-read.table("./UCI HAR Dataset/test/y_test.txt", header=FALSE)#2947x1, LABELS - activities performed in x_test (the contents of y_test matches activity labels)
testSubject<-read.table("./UCI HAR Dataset/test/y_test.txt", header=FALSE)#2947x1, SUBJECT WHO PEFORMED ACTIVITY (RANGES FROM 1 to 30) - person being measured
body_acc_x_test <-read.table("./UCI HAR Dataset/test/Inertial Signals/body_acc_x_test.txt", header=FALSE) # dim: 2947x128
body_gyro_x_test <-read.table("./UCI HAR Dataset/test/Inertial Signals/body_gyro_x_test.txt", header=FALSE) # dim: 2947x128
#### BODY_GYRO... Angular velocity vector measured by gyroscope for each window sample. Units in radians/s.
#### BODY_ACC... Body acceleration signal from accelerometer on X/Y/Z axis. Obtained by subtracting gravity from total acceleration. each row shows a 128 element vector
#### TOTAL_ACC... Acceleration signal from accelerometer on X/Y/Z axis. each row shows a 128 element vector
total_acc_x_test <-read.table("./UCI HAR Dataset/test/Inertial Signals/total_acc_x_test.txt", header=FALSE) # dim: 2947x128
total_acc_y_test <-read.table("./UCI HAR Dataset/test/Inertial Signals/total_acc_x_test.txt", header=FALSE) # dim: 2947x128
total_acc_z_test <-read.table("./UCI HAR Dataset/test/Inertial Signals/total_acc_x_test.txt", header=FALSE) # dim: 2947x128

total_acc_z_train <-read.table("./UCI HAR Dataset/train/Inertial Signals/total_acc_x_train.txt", header=FALSE) # dim: 7352x128

###  testSubject and testY appear to be identical.

### ensure each file has same number of rows
## bind with rbind() or cbind()
###-----------------------------------------------------------------------
## 2. Extract only measurements on the mean and standard 
##    deviation for each measurement
###-----------------------------------------------------------------------
## 3. Use descriptive activity labels to name the activities in data set
##    1=WALKING, 2=WALKING_UPSTAIRS, 3=WALKING_DOWNSTAIRS, 
##    4=SITTING, 5=STANDING, 6=LAYING
##    Replace activity numbers with activity labels using subsetting 
###-----------------------------------------------------------------------
## 4. Appropriately label data set (V1,V2) with descriptive variable names.
##    Names based on the action the variable is recording.
###-----------------------------------------------------------------------
## 5. Create second, independent tidy data set with the average of 
##    each variable for each activity and each subject 
##    If using write.table(), set option so that line numbers are not written
##    Explain how to read the file into R (e.g. using read.table() )
##    Dont forget the ReadMe.md, CodeBook.md, R script, and a tidy data text file for submission!

## codebook:  codebook that clearly defined the variables, calculated summaries, and units ... indicate all the variables and summaries you calculated, along with units, and any other relevant information
