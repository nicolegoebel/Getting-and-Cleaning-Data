Getting-and-Cleaning-Data Project: Creating a tidy data set
==========================================================

This instructions specify the steps taken for completion of the project for the Coursera class "Getting and Cleaning Data".

The goal of this project is to create a tidy data set from two large training and test data sets. The training and test data sets were downloaded from a Samsung Galaxy S smartphone study. Details on the variables can be obtained by looking at the CodeBook.md contained in the same directory as this README.md file. Further details on the study and resulting data sets can be found at: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones and in the README.txt file in the "UCI HAR Dataset" directory.

Steps taken in order to create the tidy data set from the two larger training and test data sets are listed below and in the R code file named "run_analysis.R". To run this code in R, be sure that you are in the directory that contains the "run_analysis.R" file, and simply type the following command at the R prompt: source("run_analysis.R")

The R code carries out the following steps:

1. Obtains the raw data from the following zip file: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
2. Unzips the zip file into a directory called "UCI HAR Dataset", where the raw test and training data sets will be found.
3. Loads raw training and test sets using read.table.
4. Labels data set appropriately with descriptive names. Raw variable names were obtained by loading the features.txt file, and removing any dots, subscripts, spaces and parentheses, and replacing commas with the word "to". Although we were instructed to make all variables lower case, capitals were left intact in order to improve readability. See CodeBook.md for explanations of variable names. The generic variable names of each training and test set (from x_test.txt and x_train.txt) were replaced with these modified variable names.
5.Combined the training and test sets: training and test data sets were "rbind"ed to the appropriate activity vector (obtained from y_train.txt and y_test.txt, respectively). Next, the complete training and test data sets were combined into one data frame named "allDat" using rbind.
6. Activities (in the "activity" feature/column) in the combined dataset were named using descriptive names, instead of their original names by number. The activity names were loaded from the activity_labels.txt file found in the UCI HAR Dataset directory. The numbered activities (1 through 6) were replaced with the following labels (as found in activity_lables.txt):  1=WALKING, 2=WALKING_UPSTAIRS, 3=WALKING_DOWNSTAIRS , 4=SITTING, 5=STANDING, 6=LAYING
7. Measurements on the mean and standard deviation for each measurement were extracted. In this case, if a variable name contained the word "mean" or "std", that column of data was extracted.
8. A second, independent tidy data set with the average of each variable for each activity and each subject was created. This file is named "tidydata.csv" and can be loaded using the following command at the R prompt (when in the directory with the file): read.csv("tidydata.csv")
9. The tiday data text file ("tidydata.txt"), README.md and CodeBook.md were submitted for the completion of this assignment.
