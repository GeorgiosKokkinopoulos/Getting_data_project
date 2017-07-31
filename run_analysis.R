unzip("project.zip")
library(plyr)
library(reshape2)
setwd("./UCI HAR Dataset")

#Read and give appropriate column names to the activity labels and the features datasets

activity_labels<-read.table("activity_labels.txt")
names(activity_labels)<-c("activity_num","activity_name")
features<-read.table("features.txt")
names(features)<-c("feature_num","feature_name")

#I am going to use the feature names as column names for the X-test and X-train datasets later 
#so I change them from factor to character format as I need to have them as a character vector

features$feature_name<-as.character(features$feature_name)

#Read and give appropriate column names to the X-test,y-test and subject-test datasets

setwd("./test")
X_test<-read.table("X_test.txt")
names(X_test)<-features$feature_name
y_test<-read.table("y_test.txt")
names(y_test)<-"activity_num"
subject_test<-read.table("subject_test.txt")
names(subject_test)<-"volunteer_num"

#I put them all together

test<-cbind(subject_test,y_test,X_test)

#In my dataset, I have the activity number but not the activity name (walking,laying etc).I am going to append this field from the "activity labels" dataset.
#Due to the appropriate names I have given to the columns, there is a common column name between the two: "activity_num". Therefore, I am going to use
#the join function (plyr package) without the need of passing any joining fields names. The activity name field goes to the end so I am going to bring it to the
#front after the first two fields. Note:You need to input your basic dataset (in this case test) as the left input and the dataset you are appending
#the additional field from (activity labels) as the right one. When I tried it the opposite way I missed some columns.

test<-join(test,activity_labels)
test<-test[,c(1,2,564,3:563)]

#I am going to do exactly the same steps with the train data.

setwd("../")
setwd("./train")
X_train<-read.table("X_train.txt")
names(X_train)<-features$feature_name
y_train<-read.table("y_train.txt")
names(y_train)<-"activity_num"
subject_train<-read.table("subject_train.txt")
names(subject_train)<-"volunteer_num"
train<-cbind(subject_train,y_train,X_train)
train<-join(train,activity_labels)
train<-train[,c(1,2,564,3:563)]

#I am going to merged the two datasets, but before doing that it's worthwhile creating a new field (which I bring to the front) 
#to identify which set my rows come from

test$source<-"test"
train$source<-"train"
test<-test[,c(565,1:564)]
train<-train[,c(565,1:564)]
merged_set<-rbind(train,test)

#I only need to keep the variables that refer to mean or std.I am going to extract their column numbers in the original set. Function grep does this work.

mean_variables<-grep("mean",features$feature_name)
std_variables<-grep("std",features$feature_name)
all_variables<-c(mean_variables,std_variables)
all_variables<-sort(all_variables)

#In my dataset, I have added 4 columns at the beginning just before the 561 feature variables. Therefore, to identify the correct positions I need to add 4 to the
#positions I have just extracted.

all_variables<-all_variables+4

#I am going to create the subset requested for this task.

merged_set<-merged_set[,c(1:4,all_variables)]

#I will only keep the first 4 variables as they stand, as all subsequent ones are those that I am going to find the average for, therefore
#they will be put in one column (after the column with their names).Function melt (reshape2 package) does this job.

merged_set_melt<-melt(merged_set,id=1:4,measure.vars=5:83)

#Finally, I am grouping the data by activity name and by volunteer number and I am calculating the average of each feature.

final_set<-dcast(merged_set_melt,activity_name+volunteer_num~variable,mean)

#I am moving back to my original folder for this project where I am going to write my output.

setwd("../")
setwd("../")
write.table(final_set,"output.txt",row.names=F)

