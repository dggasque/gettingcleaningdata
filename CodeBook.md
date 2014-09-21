# 
This codebook refers to the tidy data set created using run_analysis.R on the UCI HAR Dataset. 

Raw Data: Features data and the test and training data sets for measurements data, activity data, and subject data.

The features variables were transformed as follows:

tBodyAcc        ->  timebodyacceleration 
ttGravityAcc    ->  timegravityacceleration
tBodyAccJerk    ->  timebodyaccelerationjerk
tBodyGyro       ->  timebodygyro
tBodyGyroJerk   ->  timebodygyrojerk
tBodyAccMag     ->  timebodyaccelerationmagnitude
tGravityAccMag  ->  timegravityaccelerationmagnitude
tBodyAccJerkMag ->  timebodyaccelerationjerkmagnitude
tBodyGyroMag    ->  timebodygyromagnitude
tBodyGyroJerkMag->  timebodygyrojerkmagnitude
fBodyAcc        ->  frequencybodyacceleration
fBodyAccJerk    ->  frequencybodyacceleration
fBodyGyro       ->  frequencybodygyro
fBodyAccMag     ->  frequencybodyaccelerationmagnitude
fBodyAccJerkMag ->  frequencybodyaccelerationjerkmagnitude
fBodyGyroMag    ->  frequencybodygyromagnitude
fBodyGyroJerkMag->  frequencygyrojerkmagnitude

Activity data was transformed into descriptive name:

1 WALKING
2 WALKING_UPSTAIRS
3 WALKING_DOWNSTAIRS
4 SITTING
5 STANDING
6 LAYING

Processed Data: The set of feature variables evaluated for mean and standard deviation observations were retained.  The tidy data set(available as tidydat.txt) is average of these values for these measurements by subject identified by integers(1-30), and the activity identified as above. The measurements have been normalized so there are no units.  
