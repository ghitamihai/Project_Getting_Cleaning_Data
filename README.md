# Project_Getting_Cleaning_Data

This repo contains a script that is processing the provided data in order to fulfill the requirements of the Getting and Cleaning Data course on Coursera.

1.Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement. 
3.Uses descriptive activity names to name the activities in the data set
4.Appropriately labels the data set with descriptive variable names. 
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

In addition, this repo contains all data sets that need to be processed.

The script is run_analysis.R and should be executed in the same directory where the initial data set is located.It reads
data from the "UCI HAR Dataset" directory and writes localy a text file.

Also the scripts assumes that all the required packages are installed and loaded.

Please read the CodeBook of this data set in order to understand how the script works and which is the description of the
generated data.
