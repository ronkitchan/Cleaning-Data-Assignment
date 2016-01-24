Feature Selection 
=================

The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

tBodyAcc-XYZ
tGravityAcc-XYZ
tBodyAccJerk-XYZ
tBodyGyro-XYZ
tBodyGyroJerk-XYZ
tBodyAccMag
tGravityAccMag
tBodyAccJerkMag
tBodyGyroMag
tBodyGyroJerkMag
fBodyAcc-XYZ
fBodyAccJerk-XYZ
fBodyGyro-XYZ
fBodyAccMag
fBodyAccJerkMag
fBodyGyroMag
fBodyGyroJerkMag

The set of variables that were estimated from these signals are: 

mean(): Mean value
std(): Standard deviation

The tidy data set contains the average of each of the variables descirbed above, for each activity and each subject. The data set is sorted by activity then by subjectID. 

The method for generating the tidy data set can be summarised by the following:

1. The training data set and the test data set is read from the files "train/x_train.txt" and "test/x_test.txt",    which contain the measurements data without variable names, subject and activity identifiers.

2. Variable names are extracted from the file "features.txt" and are assigned to the training and test data sets.

3. The corresponding subject and activity identifiers for the measurements are extracted from the files    "train/subject_train.txt", "test/subject_test.txt", "train/y_train.txt", "test/y_test.txt", and are added as    columns to the training and test data sets.

4. The new training and test data sets (now containing subject and activity identifiers) are combined by    concatenation of rows. The combined data set is then sorted by SubjectID.

5. A new data set is created by extracting columns from the combined data set that contain the means and standard   deviations. The grep function was used for identifying the positions of columns that contains the expressions    "mean()" and "std().

6. The activity identifier numbers are substituted by descriptive activity names read from the file "activity_labels.txt".

7. The resulting tidy data set is created by grouping each activity and subject, with values being the average of each measurements for each group. The grouping is done using the aggregate() function.




