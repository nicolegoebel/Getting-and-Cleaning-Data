# project for Getting and Cleaning Data 
# for Coursera Data Science Signature Track
# July 2014  Nicole Goebel
###-------------------------------------------------------------------------
## 1. download zip file
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
## 2. unzip zip file:
dataDir = "UCI HAR Dataset"
if (!file.exists(dataDir)) {
    unzip("Dataset.zip")
} else {message("Samsung data directory and data already exist")}
###-------------------------------------------------------------------------
## 3. load data from zip file:
##      use read.table for text file with header = FALSE
##      subject == person being measured
##      Y_test == activities performed in x_test 
##      (the contents of y_test matches activity labels)
##      as well as X and Y (of test and train), and activity labels,
##      you will need features.txt for the column labels and you
##      will want to draw on their description of the data for writing your codebook.

testX <- read.table("./UCI HAR Dataset/test/X_test.txt", header = FALSE)
#testX has 2947 rows x 561 columns. 561 feature vector with time and frequency domain variables. TEST SET
testY<-read.table("./UCI HAR Dataset/test/y_test.txt", header=FALSE)
#testY dimensions are 2947x1, LABELS - activities performed in x_test (the contents of y_test matches activity labels)
trainX <- read.table("./UCI HAR Dataset/train/X_train.txt", header = FALSE)
#trainX has 7352 rows x 561 columns. 561 feature vector with time and frequency domain variables. TRAINING SET
trainY<-read.table("./UCI HAR Dataset/train/y_train.txt", header=FALSE)
#testY dimensions are 7352x1, LABELS - activities performed in x_train (the contents of y_train matches activity labels)

###-----------------------------------------------------------------------
## 4. Appropriately label data set (V1,V2) with descriptive variable names.
##    Names based on the action the variable is recording.
##    a. first read in the feature names and label as a vector varNames
features <- read.table("./UCI Har Dataset/features.txt")
varNames<-features$V2
##    b.  remove dots, subscripts, parentheses, spaces, etc
##        replace comma with the word "to"
##        although we were instructed to make all variables lower, 
##            I left capitals in order to improve readability.
##        see CodeBook.md for explanations of variable names.
varNames<-gsub("-","",varNames)
varNames<-gsub("\\(","",varNames)
varNames<-gsub("\\)","",varNames)
varNames<-gsub(",","to",varNames)
#varNames<-tolower(varNames)  

##     c. replace V1, V2, V3, etc in test and train data frames
##         with modified/corrected varNames
names(trainX)<-varNames
names(testX)<-varNames

###-------------------------------------------------------------------------
## 5. Bind training and test sets to create one data set
##    Ensure each file has same number of rows
##    Bind with cbind() for each training and test set
##      and rbind() to merge training and test sets
activity<-trainY$V1             #get y_test as vector
trainAll<-cbind(activity,trainX)#bind y_test vector to x_test
activity<-testY$V1              #get y_train as vector
testAll<-cbind(activity,testX)  #bind y_train vector to y_test
allDat<-rbind(testAll, trainAll)#bind train and test sets

###-----------------------------------------------------------------------
## 6. Use descriptive activity labels to name the activities in data set
##    1=WALKING, 2=WALKING_UPSTAIRS, 3=WALKING_DOWNSTAIRS, 
##    4=SITTING, 5=STANDING, 6=LAYING
##    Replace activity numbers with activity labels using subsetting 
activityLabels <- read.table("./UCI Har Dataset/activity_labels.txt")
allDat$activity[allDat$activity == "1"] <- as.character(activityLabels$V2[1])
allDat$activity[allDat$activity == "2"] <- as.character(activityLabels$V2[2])
allDat$activity[allDat$activity == "3"] <- as.character(activityLabels$V2[3])
allDat$activity[allDat$activity == "4"] <- as.character(activityLabels$V2[4])
allDat$activity[allDat$activity == "5"] <- as.character(activityLabels$V2[5])
allDat$activity[allDat$activity == "6"] <- as.character(activityLabels$V2[6])
##     ensure character values are factors
allDat$activity <- as.factor(allDat$activity)

###-----------------------------------------------------------------------
## 7. Extract only measurements on the mean and standard 
##    deviation for each measurement
##    First get list of varNames to extract
##      - be sure to include the "activity" column
extr<-c("activity", varNames[grep("activity|mean|std", varNames)])
write.table(extr, "extr_vars.txt") # writes feature names to file
##    Then extract these variables by their name from data frame
MeanStdDat <- allDat[,extr]

###-----------------------------------------------------------------------
## 6. Create second, independent tidy data set with the average of 
##    each variable for each activity and each subject 
##    If using write.table(), set option so that line numbers are not written
library(dplyr)
tidy<- MeanStdDat %>% group_by(activity) %>% summarise_each(funs(mean))
write.csv(tidy, file="tidydata.csv", row.names=FALSE)
write.table(tidy, file="tidydata.txt", row.names=FALSE)
## the above files can be loaded with the following commands:
#  read.csv("tidydata.csv" or read.table("tidydata.txt")

##    Dont forget the ReadMe.md, CodeBook.md, R script, and a tidy data text file for submission!
## codebook:  codebook that clearly defined the variables, calculated summaries, and units ... indicate all the variables and summaries you calculated, along with units, and any other relevant information
