# Getting and Cleaning Data - Course Project

## Course Project Goals

You should create one R script called run_analysis.R that does the following.

1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement.
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive activity names.
5. Creates a second, independent tidy data set with the average of each variable for each activity and each subject.

## Steps to work on this course project

1. Download the data source and put into a folder on your local drive. You'll have a ```UCI HAR Dataset``` folder.
2. Put ```run_analysis.R``` in the parent folder of ```UCI HAR Dataset```, then set it as your working directory using ```setwd()``` function in RStudio.
3. Run ```source("run_analysis.R")```, then it will generate a new file ```tidy-dataset-averages.txt``` in your working directory.

## Code Book

If you're interested in seeing the Code Book for the tidy data generated ny the script, please
access the [CodeBook.md](./CodeBook.md)

## Details and Contacts

For more details about this script, you can call me directly: rafaelpaiva@gmail.com