Explanation of variables (a.k.a. features) found in raw and tidy data sets
=========================================================================

A detailed explanation for the features in the raw data sets can be found in the "features_info.txt" file found within the unzipped "UCI HAR Dataset" directory. A brief description is found here.

The files X_test.txt and X_train.txt each contain numbers for 561 features (columns) containing time and frequency domain variables (detailed in "features_info.txt"). X_test.txt has 2947 rows, while X_train has 7352 rows (for each subject or observatino). When loaded into R, the values of each of these data sets are numbers. As outlined in the README.md file, any feature containing the word "mean" or "std" were extracted into the tidy data set, which contains the average of each feature (or variable) for each activity (outlined below) and each subject (found in each row).

The first feature is for "activities" which include WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING and LAYING. This variable is in FACTOR form.

The remaining features that were extracted from the raw data sets are listed  below (this list can also be found in the file "extra_vars.txt"), and are named according to the following conventions:
* The column number is listed to the left of each feature. 
* Each feature is a vector of NUMBER types. 
* Features containing the word "mean" are a average of the signal while "meanFreq" indicates an average of the frequency components to obtain a mean frequency. 
* Features containing "std" are a standard deviation of the mean for that feature. 
* Features that begin with the letter "t" indicate that the features were derived in time. 
* Letters "X", "Y", "Z" indicate the direction of the three-axial raw signal. 
* Features come from the accellerometer (denoted by "Acc") and gyroscope (denoted by "Gyro"), or body (denoted by "Body" or "BodyBody") and gravity (dnoted by "Gravity") acceleration signals. 
* Jerk (denoted by "Jerk") signals were obtained from body linear acceleration and angular velocity. 
* "Mag" denotes the magnitude of three-dimensional signals (i.e., "X", "Y", "Z") calcuated using the Euclidean norm. 
* All features are numbers that are normalized and range from -1 to 1.

These features are listed below:

*"2" "tBodyAccmeanX"
*"3" "tBodyAccmeanY"
*"4" "tBodyAccmeanZ"
*"5" "tBodyAccstdX"
*"6" "tBodyAccstdY"
*"7" "tBodyAccstdZ"
*"8" "tGravityAccmeanX"
*"9" "tGravityAccmeanY"
*"10" "tGravityAccmeanZ"
*"11" "tGravityAccstdX"
*"12" "tGravityAccstdY"
*"13" "tGravityAccstdZ"
*"14" "tBodyAccJerkmeanX"
*"15" "tBodyAccJerkmeanY"
*"16" "tBodyAccJerkmeanZ"
*"17" "tBodyAccJerkstdX"
*"18" "tBodyAccJerkstdY"
*"19" "tBodyAccJerkstdZ"
*"20" "tBodyGyromeanX"
*"21" "tBodyGyromeanY"
*"22" "tBodyGyromeanZ"
*"23" "tBodyGyrostdX"
*"24" "tBodyGyrostdY"
*"25" "tBodyGyrostdZ"
*"26" "tBodyGyroJerkmeanX"
*"27" "tBodyGyroJerkmeanY"
*"28" "tBodyGyroJerkmeanZ"
*"29" "tBodyGyroJerkstdX"
*"30" "tBodyGyroJerkstdY"
*"31" "tBodyGyroJerkstdZ"
*"32" "tBodyAccMagmean"
*"33" "tBodyAccMagstd"
*"34" "tGravityAccMagmean"
*"35" "tGravityAccMagstd"
*"36" "tBodyAccJerkMagmean"
*"37" "tBodyAccJerkMagstd"
*"38" "tBodyGyroMagmean"
*"39" "tBodyGyroMagstd"
*"40" "tBodyGyroJerkMagmean"
*"41" "tBodyGyroJerkMagstd"
*"42" "fBodyAccmeanX"
*"43" "fBodyAccmeanY"
*"44" "fBodyAccmeanZ"
*"45" "fBodyAccstdX"
*"46" "fBodyAccstdY"
*"47" "fBodyAccstdZ"
*"48" "fBodyAccmeanFreqX"
*"49" "fBodyAccmeanFreqY"
*"50" "fBodyAccmeanFreqZ"
*"51" "fBodyAccJerkmeanX"
*"52" "fBodyAccJerkmeanY"
*"53" "fBodyAccJerkmeanZ"
*"54" "fBodyAccJerkstdX"
*"55" "fBodyAccJerkstdY"
*"56" "fBodyAccJerkstdZ"
*"57" "fBodyAccJerkmeanFreqX"
*"58" "fBodyAccJerkmeanFreqY"
*"59" "fBodyAccJerkmeanFreqZ"
*"60" "fBodyGyromeanX"
*"61" "fBodyGyromeanY"
*"62" "fBodyGyromeanZ"
*"63" "fBodyGyrostdX"
*"64" "fBodyGyrostdY"
*"65" "fBodyGyrostdZ"
*"66" "fBodyGyromeanFreqX"
*"67" "fBodyGyromeanFreqY"
*"68" "fBodyGyromeanFreqZ"
*"69" "fBodyAccMagmean"
*"70" "fBodyAccMagstd"
*"71" "fBodyAccMagmeanFreq"
*"72" "fBodyBodyAccJerkMagmean"
*"73" "fBodyBodyAccJerkMagstd"
*"74" "fBodyBodyAccJerkMagmeanFreq"
*"75" "fBodyBodyGyroMagmean"
*"76" "fBodyBodyGyroMagstd"
*"77" "fBodyBodyGyroMagmeanFreq"
*"78" "fBodyBodyGyroJerkMagmean"
*"79" "fBodyBodyGyroJerkMagstd"
*"80" "fBodyBodyGyroJerkMagmeanFreq"
