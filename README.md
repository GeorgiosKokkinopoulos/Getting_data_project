# Getting_data_project

The project for the Getting and Cleaning Data course of the Data Science specialization

I start by unzipping the project file (it contains all datasets necessary for the task) and loading the packages I use (plyr and reshape2).
I also read and give appropriate column names to the activity labels and the features datasets.

Then I read and give appropriate column names to the X-test (these are the feature names I read in the previous step-569 variables),y-test and subject-test datasets

Then I put them all together in one dataset in the order subject_test - y_test - X_test by using cbind.

In this dataset, I have the activity number (y_test) but not the activity name (walking,laying etc). So,I append this field from the "activity labels" dataset.
Due to the relevant names I have given to the columns, there is a common column name between the two datasets: "activity_num". Therefore the join function
(plyr package) performs this task easily. The activity name field goes to the end so I will then bring it to the front just after the first two fields.
It's important that I input the basic dataset (in this case it's "test") as the left input and the dataset I used to appendthe additional field from
(activity labels) as the right one otherwise some columns might be missed.

Then I do exactly the same steps with the train data.

Next step is to merge the two datasets (test and train) by using rbind.

I only need to keep the variables that refer to mean or std so I use function "grep" to extract their column numbers in the dataset
named "features" I used at the beginning. However, in the new dataset, I have already added 4 columns at the beginning just before the 561 feature variables.
Therefore, to identify the correct positions I add 4 to the positions I have just extracted. I use these positions to create my new subset.

I only keep the first 4 variables as they stand, as all subsequent ones are those that I find the average for, therefore
they will be put in one column (after the column with their names).Function "melt2" (package "reshape2") does this job.

Finally, I group the data by activity name (walking, sitting etc.) and by volunteer number (1 to 30) and I calculate the average of each feature. "dcast" is the
function for that. I also add the prefix "ave" to the names of the columns that represent the features to distinguish them from the original feature variables.




