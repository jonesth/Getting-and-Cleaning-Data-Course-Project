# Getting-and-Cleaning-Data-Course-Project
Submission for the Coursera Getting and Cleaning Data Course Project

Summary

The repository contains the run_analysis.R script.  This script merges the 'training' and 'test' data from the UCI Machine Learning Repository / Human Activity Recognition Using Smartphones Data Set project to produce a single data set containing only the mean and standard deviations for each measurement.  The included codebook.md describes the variables, data and transformations performed.

Approach

- Load the reshape2 package to use later
- Merge the 'training' and 'test' data sets to create one data set
- Extract only the mean and standard deviation for each measurement
- Label the data set with descriptive activity names
- Create a second, independent tidy data set (tidy.txt) with the average of each variable for each activity and each subject
