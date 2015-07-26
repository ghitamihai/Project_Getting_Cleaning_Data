# Copyrights M. Ghita

# Read test data set
subject_test <- read.table("./UCI HAR Dataset/test/subject_test.txt")
x_test <- read.table("./UCI HAR Dataset/test/X_test.txt")
y_test <- read.table("./UCI HAR Dataset/test/Y_test.txt")

# Read training data set
subject_train <- read.table("./UCI HAR Dataset/train/subject_train.txt")
x_train <- read.table("./UCI HAR Dataset/train/X_train.txt")
y_train <- read.table("./UCI HAR Dataset/train/Y_train.txt")

# Read features and activity data
features<-read.table("./UCI HAR Dataset/features.txt")
activity<-read.table("./UCI HAR Dataset/activity_labels.txt")

# Name each activity from training and test data sets
names(x_train)<-features[,2]
names(x_test)<-features[,2]
names(subject_train)<-as.character("Person")
names(y_train)<- as.character("Activity")
names(subject_test)<-as.character("Person")
names(y_test)<- as.character("Activity")

# Merge test and training labels IDs with activitaty's names and then name the new columns
y_test2<-merge(y_test,activity, by.x="Activity",by.y="V1")
names(y_test2)<- c("ID", "Activity")
y_train2<-merge(y_train,activity, by.x="Activity",by.y="V1")
names(y_train2)<- c("ID", "Activity")

# Concatenate the subject, with his activities and observations for training and test sets
train<- data.frame(subject_train,y_train2[2],x_train)
test<-data.frame(subject_test,y_test2[2],x_test)

# Merge the training and the test sets to create one data set.
main<-rbind(train,test)

# Extracts the measurements on the mean and standard deviation for each measurement that match the pattern "std" 
# and "[Mm]ean"
subset1<-main[,c(1,2,grep("std",colnames(main)), grep("[Mm]ean",colnames(main)))]

# Creates a second, independent tidy data set with the average of each variable for each activity and each subject
aveg <- aggregate(subset1[,3:88],by=list(subset1$Activity,subset1$Person),mean,na.rm=TRUE)
colnames(aveg)[2]<-as.character("Person")
colnames(aveg)[1]<-as.character("Activity")

# Write the new tidy data set into a text file.
write.table(aveg,file="./set1.txt", row.names = FALSE, quote = FALSE)

# Show the new tidy data set
View(aveg)