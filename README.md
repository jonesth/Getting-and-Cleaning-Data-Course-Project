# Getting-and-Cleaning-Data-Course-Project
Submission for the Coursera Getting and Cleaning Data Course Project

Summary

The repository contains the run_analysis.R script.  This script that merges the 'training' and 'test' data from the UCI Machine Learning Repository / Human Activity Recognition Using Smartphones Data Set project to produce a single data set containing only the mean and standard deviations for each measurement.  The included codebook.md describes the variables, data and transformations performed.

Approach

- Load reshape2 package to use later
- Merges the training and the test sets to create one data set
- Extract only the measurements on the mean and standard deviation for each measurement
- Label the data set with descriptive activity names
- Create a second, independent tidy data set (tidy.txt) with the average of each variable for each activity and each subject
