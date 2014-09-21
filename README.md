# 

#Analysis Code For Human Activity Recognition Using Smartphones

##Read these files in from UCI HAR Dataset directory : 

###From the test directory: 

* X_test.tx              (measurement data)
* y_test.txt             (activity data)
* subject_test.txt       (subject data)

###From the train directory

* X_train.txt            (measurement data)
* y_train.txt            (activity data)
* subject_train.txt            (subject data)

##Combine test data to training data to form three unified data sets.
* Data from X-train is added to X-test to form data frame named "data".
* Data y-train is added to y-test to form data frame "activity".
* Training subject data is added to test subject data to form data frame "subject".
* Test and training data frames are removed from environment to leave only combined data sets.

##Load and manipulate features data
* The file features.txt is read from the UCI HAR Dataset directory to create "feats" data set.
* The feats data set is filtered to retain only the mean[mean()] and standard deviation[std()] variables.
* The names of the retained features are changed to improve uniformity, remove confusing symbols, and make them more descriptive.

##Manipulate measurement data to eliminate columns that do not pertain to retained features, and to attach descriptive variable names. 
* Columns of measurement data frame(called "data") are selected using the index variable(feats$V1) retained from filtering the features data frame.
* Variable names are attached using the features variable(feats$V2).

##Attach variables for activity and subject data to measurement data, and give activity descriptive names
* Activity and subject data are given descriptive variable names
* Activity and subject columns are added to the measurement data to create one unified data frame(data). 
* Activity, subject, and feats data frames are removed from environment leaving only unified data frame.
* Numerical identifiers are replace with descriptive activity names in activity column. 

##Create and save tidy data set
* New data set is is created from unified data frame that takes mean values for all measurements by subject and activity called "tidydata".
* Tidy data frame is saved as tidydata.txt in working directory.


