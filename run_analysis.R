

##Load required packages
require(dplyr)


##This segment deals with combining the test and training data 
   
   ###The data sets needed for this procedure are the measurement data sets(marked with an X), activity data sets(marked with a y), 
   ###and the subject data sets.  The processed used in this code was to load the data set group(i.e. measurement data), create a new unified data 
   ###set by using row bind always with the test set in the lead. 
   
        ###The measurement data set
        test <- read.table("./UCI HAR Dataset/test/X_test.txt")

        train <- read.table("./UCI HAR Dataset/train/X_train.txt")

        data <- rbind(test, train)

        rm(list = c("test", "train"))



        ###The activity data set
        activity_test <- read.table("./UCI HAR Dataset/test/y_test.txt")

        activity_train <- read.table("./UCI HAR Dataset/train/y_train.txt")

        activity <- rbind(activity_test, activity_train)

        rm(list = c("activity_test", "activity_train"))


        ###The subject data set
        subtest <- read.table("./UCI HAR Dataset/test/subject_test.txt")
        subtrain <- read.table("./UCI HAR Dataset/train/subject_train.txt")

        subject <- rbind(subtest, subtrain)

        rm(list = c("subtest", "subtrain"))


##This next segment deals with cleaning up the features data set and using it to clean the measurement data set and lable the variables

        ###Load features data set
        feats <- read.table("./UCI HAR Dataset/features.txt", stringsAsFactor = FALSE)

        ###Select Only for only the variables that correspond with the mean and standard deviation measurements
        feats <- filter(feats, grepl("mean\\(", V2) | grepl("std\\(", V2))

        ###Remove unneccessary puncuation and change remaining variable names to lower case
        feats$V2 <- tolower(feats$V2)
        feats$V2 <- gsub("-", "", feats$V2)
        feats$V2 <- gsub("\\(", "", feats$V2)
        feats$V2 <- gsub("\\)", "", feats$V2)
        
        ###Give features variables more descriptive names
        feats$V2 <- gsub("std", "standarddeviation", feats$V2) 
        feats$V2 <- gsub("tbody", "timebody", feats$V2)
        feats$V2 <- gsub("tgravity", "timegravity", feats$V2) 
        feats$V2 <- gsub("acc", "acceleration", feats$V2) 
        feats$V2 <- gsub("fbody", "frequencybody", feats$V2) 
        feats$V2 <- gsub("mag", "magnitude", feats$V2) 

        ### Use column that indicated the index of the features to select for the corresponding columns from the measurement data
        data <- select(data, feats$V1)

        ### Set variable names of the measurement data using the features data 
        colnames(data) <- feats$V2


## This section of the code covers labling the activity and subject data, attaching them to the measurement data and giving the activities descriptive names
        
        ###lable subject and activity data 
        colnames(activity) <- "activity"
        colnames(subject) <- "subject"

        ###attach the subject and activity to the measurement data to creat one unified data set
        data <- cbind(data, subject, activity)

        rm(list = c("activity", "feats", "subject"))

        ###Give activity data descriptive names
        data$activity[data$activity == 1] <- "walking"
        data$activity[data$activity == 2] <- "walking upstairs"
        data$activity[data$activity == 3] <- "walking downstairs"
        data$activity[data$activity == 4] <- "sitting"
        data$activity[data$activity == 5] <- "standing"
        data$activity[data$activity == 6] <- "laying"


## The final segment creates a second tidy data set that contains the average for the measurements for each activity and subject  

        ###Use dplyr to create indpendent tidy data set grouped by subject and activity then average the measurements for each grouping
        tidy_df <- data %>%
        group_by(subject, activity) %>%
        summarise_each(funs(mean))
        
        ###Save data set as text file
        write.table(tidy_df, file = "tidydata.txt", row.names = FALSE)
