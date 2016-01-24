# Assuming the function is ran when the current directory contains the folder
# and files under the following structure:
#
# files: "features.txt", "activity_labels.txt"
# folder: "train" with files ->  "subject_train.txt","X_train.txt","y_train.txt"
# folder: "test" with files -> "subject_test.txt","X_test.txt","y_test.txt" 
#
# the function "run_analysis" performs the following on the data set:
# 1. Merges the training and the test sets to create one data set.
# 2. Extracts only the measurements on the mean and standard deviation 
#    for each measurement.
# 3. Uses descriptive activity names to name the activities in the data set
# 4. Appropriately labels the data set with descriptive variable names.
# 5. Create and return an independent tidy data set with the average of each 
#    variable for each activity and each subject.
#
# The returned tidy data set is sorted first by Activity type then by SubjectID

run_analysis <- function() {
  
  # Load the dplyr package
  library(dplyr)
  
  # Read the obervations from the training data set and the test data set
  train <- read.table("train/x_train.txt")
  test <- read.table("test/x_test.txt")
  
  # Read the descriptive variable names from the file "features.txt",
  # assign the variable names to the data sets (#4 on assignment instructions)
  features <- read.table("features.txt")
  names(train) <- features$V2
  names(test) <- features$V2
  
  # Read and assign subject and activity identifiers to the training data set
  train_subjects <- read.table("train/subject_train.txt")
  train[["SubjectID"]] <- train_subjects$V1   #add the subject identifier column
  train_activities <- read.table("train/y_train.txt")
  train[["Activity"]] <- train_activities$V1   #add the activity identifier column
  
  # Read and assign subject and activity identifiers to the test data set
  test_subjects <- read.table("test/subject_test.txt")
  test[["SubjectID"]] <- test_subjects$V1   #add the subject identifier column
  test_activities <- read.table("test/y_test.txt")
  test[["Activity"]] <- test_activities$V1   #add the activity identifier column

  # Merge the training and test data set by concatenating observations (by rows),
  # then sort the data set by Subject ID (#1 on assignment instructions)
  data <- arrange(rbind(train,test),SubjectID)
  
  # Extracts only the measurements on the mean and standard deviations,
  # assign the values to a new data set called selected_data
  # (#2 on assignment instructions)
  mean_index <- grep("mean()",names(data))   #indices for the 'mean' columns
  std_index <- grep("std()",names(data))   #indices for the 'standard deviation' columns
  selected_data <- data[c(mean_index,std_index,grep("SubjectID|Activity",names(data)))]
  
  # Read the descriptive activity names and assign to the corresponding
  # activity labels (numeric) as character strings (#3 on assignment instructions)
  activity_labels <- read.table("activity_labels.txt")
  selected_data$Activity <- activity_labels[match(selected_data$Activity,activity_labels[,1]),2]
  selected_data$Activity <- sapply(selected_data$Activity,as.character) #convert to characters
  
  # Create independent data set containing the average of each variable 
  # for each activity and each subject (#5 on assignment instructions)
  tidy_data <- aggregate(selected_data[,1:79],list(selected_data$SubjectID,selected_data$Activity),mean)
  tidy_data <- tidy_data[,c(2,1,3:length(tidy_data))]  
  names(tidy_data)[1:2] <- c("Activitiy","SubjectID")
  
  return(tidy_data)
  
}