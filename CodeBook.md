Creating a Tidy Data Set 

A training and test data sets were downloaded from a Samsung Galaxy S smartphone study in order to create a tidy data set. The following steps were taken in order to create the tidy data set from the two larger training and test data sets. Further details on the study and resulting data sets can be found at: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones. The code for this protocol can be found in run_analysis.R.

1. Data were obtained from the following zip file: 
* https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
2. Zip file was unzipped for access to test and training data sets.
3. Training and test data sets were merged into one data sert.
4. Measurements on the mean and standard deviation for each measurement were extracted.
5. Activities in data set were named using descriptive names.
6. Data set was labeled appropriately with descriptive names.
7. A second, independent tidy data set with the average of each variable for each activity and each subject was created.



