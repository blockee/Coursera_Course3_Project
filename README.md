Coursera_Course3_Project
========================

The course project in the third class of the Coursera Data Science specialization, Getting and Cleaning Data.

The run_analysis.R file assumes that the raw data files are located in your working directory. 

A full description of the data used can be found here:
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

The zip file to the data can be downloaded here:
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

run_analysis.R requires the following unzipped files to be in your working directory:
"features.txt", "X_test.txt", "subject_test.txt", "Y_test.txt", "X_train.txt",
"Y_train.txt", "subject_train.txt"

run_analysis.R selects only the columns showing mean and standard deviation values for each data set. It then combines the train and test observations and adds the subject number and activity number as separate columns on the left-hand side. Then, a new summary data frame is created. This summary data contains the mean of each variable for each subject and activity.

Finally, activities are given descriptive labels to replace numbers and variable names are cleaned up to remove capital letters and periods.


