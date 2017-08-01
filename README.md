# Getting_data_project

The project for the Getting and Cleaning Data course of the Data Science specialization

I start by unzipping the project file (it contains all datasets necessary for the task) and loading the packages I use (plyr and reshape2).

unzip("project.zip")
library(plyr)
library(reshape2)
setwd("./UCI HAR Dataset")


I also read and give appropriate column names to the activity labels and the features datasets.

activity_labels<-read.table("activity_labels.txt")
names(activity_labels)<-c("activity_num","activity_name")
features<-read.table("features.txt")
names(features)<-c("feature_num","feature_name")


Then I read and give appropriate column names to the X-test (these are the feature names I read in the previous step-569 variables),y-test and subject-test datasets

features$feature_name<-as.character(features$feature_name)
setwd("./test")
X_test<-read.table("X_test.txt")
names(X_test)<-features$feature_name
y_test<-read.table("y_test.txt")
names(y_test)<-"activity_num"
subject_test<-read.table("subject_test.txt")
names(subject_test)<-"volunteer_num"


Then I put them all together in one dataset in the order subject_test - y_test - X_test by using cbind.

test<-cbind(subject_test,y_test,X_test)


In this dataset, I have the activity number (y_test) but not the activity name (walking,laying etc). So,I append this field from the "activity labels" dataset.
Due to the relevant names I have given to the columns, there is a common column name between the two datasets: "activity_num". Therefore the join function
(plyr package) performs this task easily. The activity name field goes to the end so I will then bring it to the front just after the first two fields.
It's important that I input the basic dataset (in this case it's "test") as the left input and the dataset I used to appendthe additional field from
(activity labels) as the right one otherwise some columns might be missed.

test<-join(test,activity_labels)
test<-test[,c(1,2,564,3:563)]


Then I do exactly the same steps with the train data.

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


Next step is to merge the two datasets (test and train) by using rbind.

test$source<-"test"
train$source<-"train"
test<-test[,c(565,1:564)]
train<-train[,c(565,1:564)]
merged_set<-rbind(train,test)


I only need to keep the variables that refer to mean or std so I use function "grep" to extract their column numbers in the dataset
named "features" I used at the beginning. However, in the new dataset, I have already added 4 columns at the beginning just before the 561 feature variables.
Therefore, to identify the correct positions I add 4 to the positions I have just extracted. I use these positions to create my new subset.

mean_variables1<-grep("mean",features$feature_name)
mean_variables2<-grep("Mean",features$feature_name)
std_variables<-grep("std",features$feature_name)
all_variables<-c(mean_variables1,mean_variables2,std_variables)
all_variables<-sort(all_variables)
all_variables<-all_variables+4
merged_set<-merged_set[,c(1:4,all_variables)]


I only keep the first 4 variables as they stand, as all subsequent ones are those that I find the average for, therefore
they will be put in one column (after the column with their names).Function "melt" (package "reshape2") does this job.

merged_set_melt<-melt(merged_set,id=1:4,measure.vars=5:90)

Finally, I group the data by activity name (walking, sitting etc.) and by volunteer number (1 to 30) and I calculate the average of each feature. "dcast" is the
function for that. I also add the prefix "ave" to the names of the columns that represent the features to distinguish them from the original feature variables.

final_set<-dcast(merged_set_melt,activity_name+volunteer_num~variable,mean)
colnames(final_set)[3:88]<-paste("ave",colnames(final_set[,3:88]),sep="_")

I also write my output 

setwd("../")
setwd("../")
write.table(final_set,"output.txt",row.names=F)



