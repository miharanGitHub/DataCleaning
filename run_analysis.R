dir<-"C:/Users/nmha/Documents/Coursera"
setwd(dir)

library(reshape2)

# Read the data sets 
features <- read.table("features.txt", col.names=c("id", "name"))
activityLabels <- read.table("activity_labels.txt", col.names=c("id", "name"))
y_train<-read.table("train/y_train.txt", col.names=c("activity"))			   
X_train<-read.table("train/X_train.txt")
subject_train<-read.table("train/subject_train.txt", col.names=c("subject"))
y_test<-read.table("test/y_test.txt", col.names=c("activity"))			   
X_test<-read.table("test/X_test.txt")
subject_test<-read.table("test/subject_test.txt", col.names=c("subject"))

# Create variables which contains the clear activity category names
# for the training and test sets
activityNames_train<-factor(ac<-y_train$activity, labels=as.character(activityLabels$name))
activityNames_test<-factor(ac<-y_test$activity, labels=as.character(activityLabels$name))

# Find indices for the measurements in the features data set, 
# which correspond only to "mean" and "std" measurements 
# (and not "meanFreq" for example)
index<-grep("mean\\(|std\\(", features$name)

# Create a vector which contains only desired measurements' names  
variableClearNames<-features$name[index]

# and select only desired measurements from data sets
Train_short<-X_train[,index]
Test_short<-X_test[,index]

# rename variables in data sets with understandable names
names(Train_short)<-variableClearNames
names(Test_short)<-variableClearNames

# Combine the data sets with subjects and activity labels
Train<-cbind(subject=subject_train, activity=activityNames_train, Train_short)
Test<-cbind(subject=subject_test, activity=activityNames_test, Test_short)

# Merges the training and test sets
Data<-rbind(Train, Test)

# Create a melted data set 
MeltData <- melt(Data,id=c("subject","activity"),measure.vars=names(Data[,-c(1,2)]))
# Cast the data set using "mean" function and create a tidy data set
AvgData <- dcast(MeltData, subject+activity ~ variable, mean)

# Save tidy data set as a text file 
write.table(AvgData, "TidyData.txt", sep="\t")




