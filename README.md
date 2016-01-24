Assuming the function is ran when the working directory contains the folder
and files under the following structure:

files: "features.txt", "activity_labels.txt"
folder: "train" with files ->  "subject_train.txt","X_train.txt","y_train.txt"
folder: "test" with files -> "subject_test.txt","X_test.txt","y_test.txt" 

The function "run_analysis" performs the following on the data set:

1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation 
   for each measurement.
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names.
5. Create and return an independent tidy data set with the average of each 
   variable for each activity and each subject.

The returned tidy data set, contained in the file "tidy_data.txt" is sorted 
first by Activity type then by SubjectID.

The file "CodeBook.md" describes the variables, the data, and all transformations
performed to generate the tidy data set.