This codebook is applicable to the run_analysis.R script required for the project
of the Getting and Cleaning Data course on Coursera.

This script reads following data sets:
======================================
- subject_test : A list with identifiers of the subjects that carried out the experiment and belong to testing group.Its range is from 1 to 30
- x_test : A 561-feature vector with time and frequency domain variable for testing group of subjects
- y_test : Activity label IDs for testing group of subjects 

- subject_train : A list with identifiers of the subjects that carried out the experiment and belong to training group.Its range is from 1 to 30
- x_train : A 561-feature vector with time and frequency domain variable for training group of subjects
- y_train : Activity label IDs for training group of subjects 

- features : List of all features
- activity : This links the class labels with their activity name

The dataset includes the following files:
=========================================

- 'README.md'

- 'CodeBook.md'

- 'run_analysis.R': R script to process the Samsung data

- 'UCI HAR Dataset': directory which contains tha Samsung data

- 'set1.txt': tidy data set with the average of each variable for each activity and each subject

=========================================
Note: For the Samsung data set description please check the 'UCI HAR Dataset/README.txt' file.
=========================================

The Samsung data was processed following next steps in order to fulfill the project requirements:
=================================================================================================

- all training and test data sets were read in R in corresponding variables to their names (subject_train, x_train,y_train,subject_test,x_test,y_test)
- the list of all features and the label of each activity was read in R in variable that correspond to their name (features, activity)
- descriptive activity names from features variable were used to name the test and training data sets
- to the subject_test and subject_train sets the "Person" tag was assigned as a column name
- a similar approach was used for y_test and y_train were "Activity" string was used to define the column name
- in order to retrieve the corresponding activity name for the IDs from y_train and y_test, these two sets were merged with the activity variable base on the ID column
and two new sets of labels resulted: y_test2 and y_train2 that contain the identifier of the activity and the activity name.
- further a new data frame called train was created using the subject_train, y_train2[2] and x_train data sets
- a similar for the test group, a new test data frame was created using the subject_test, y_test2[2] and x_test data sets
- in order to complete the first requirement of the project, the test and train data frames were combined using the rbind() function in one main data frame.
- to extract the measurements on the mean and standard deviation for each measurement a new variable called subset1 was created with all columns from the main data set 
that match the pattern "std" and "[Mm]ean"
- from this subset1 data set a new tidy data set with the average of each variable for each activity and each subject was built with using functions aggregate() and mean and stored
in a new variable named aveg
- the content of aveg variable was written into a file called set1.txt using write.table() function

Note: 
======
As the set1.txt data set contains all the columns from Samsung data that match the pattern "std" and "[Mm]ean" it is recommended to check the coresponding README.txt file for their 
description.

Variable's dimensions:
======================
- subject_test [2947,1]
- x_test [2947,561]
- y_test [2947,1]
- subject_train [7352,1]
- x_train [7352,561]
- y_train [7352,1]
- features [561,2]
- activity [6,2]
- y_test2 [2947,2]
- t_train2 [7352,2]
- test [2947,563]
- train [7352,563]
- main [10299,563]
- subset1 [10299,88]
- aveg [40,88]
