## Script for processing  information from Galaxy S device and perform analysis.
## Coursera exercise - Getting and Cleaning Data
## https://class.coursera.org/getdata-010/
## Rafael Rodrigues de Paiva - Brazil
## rafaelpaiva@gmail.com
## 
## The mais steps for this script include:
## a) Merging training and test data sets to create one data set.
## b) Doing some cleanup for all column names, redefining some of them.
## c) Uses descriptive activity names to name the activities in the data set.
## d) Calculating the average for the variables. 
## e) Outputing the master data set file.

##### 
## Step 1: reading all data sets for manipulating the data and creating the tidy data
#####
activityLabels <- read.table("./UCI HAR Dataset/activity_labels.txt", header=FALSE)    
features <- read.table("./UCI HAR Dataset/features.txt", header=FALSE)
trainSubject <- read.table("./UCI HAR Dataset/train/subject_train.txt", header=FALSE)
trainY <- read.table("./UCI HAR Dataset/train/y_train.txt", header=FALSE)
trainX <- read.table("./UCI HAR Dataset/train/X_train.txt", header=FALSE)
testSubject <- read.table("./UCI HAR Dataset/test/subject_test.txt", header=FALSE)
testY <- read.table("./UCI HAR Dataset/test/y_test.txt", header=FALSE)
testX <- read.table("./UCI HAR Dataset/test/X_test.txt", header=FALSE)

#####
## Step 2: merging all rows present in training and test data frames
#####
subjects <- rbind(trainSubject, testSubject)
activities <- rbind(trainY, testY)  ## Y: activities performed
readings <- rbind(trainX, testX)    ## X: reading done

#####
## Step 3: organizing activities and features labels
#####

## Defining the activity labels based on ID  and put result in new activity name column.
names(activityLabels) <- c("activity_id", "activity_name")
activities[, 1] = activityLabels[activities[, 1], 2]

names(activities) <- "Activity"
names(subjects) <- "Subject"

names(readings) <- features[, 2]

new_features <- grepl("mean|std", features[, 2])
readings <- readings[, new_features]

#####
## Step 4: combining the data sets to create the tidy data set
#####

# Combines data table by columns
tidyDS <- cbind(subjects, activities, readings)

#####
## Step 5: Calculating the average for the variables
#####

# Creating a 2nd, independent tidy data set with the average for each activity and each subject
temp <- tidyDS[, 3:dim(tidyDS)[2]]
finalTidyData <- aggregate(temp, list(tidyDS$Subject, tidyDS$Activity), mean)

# Activity and Subject name of columns 
names(finalTidyData)[1] <- "Subject"
names(finalTidyData)[2] <- "Activity"

#####
## Step 6: saving the tiny data in file
#####

write.table(finalTidyData, "./tidy-dataset-averages.txt", row.name=FALSE)