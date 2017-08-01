Feature Selection 
=================

The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

tBodyAcc-XYZ
tGravityAcc-XYZ
tBodyAccJerk-XYZ
tBodyGyro-XYZ
tBodyGyroJerk-XYZ
tBodyAccMag
tGravityAccMag
tBodyAccJerkMag
tBodyGyroMag
tBodyGyroJerkMag
fBodyAcc-XYZ
fBodyAccJerk-XYZ
fBodyGyro-XYZ
fBodyAccMag
fBodyAccJerkMag
fBodyGyroMag
fBodyGyroJerkMag

The set of variables that were estimated from these signals are: 

mean(): Mean value
std(): Standard deviation
mad(): Median absolute deviation 
max(): Largest value in array
min(): Smallest value in array
sma(): Signal magnitude area
energy(): Energy measure. Sum of the squares divided by the number of values. 
iqr(): Interquartile range 
entropy(): Signal entropy
arCoeff(): Autorregresion coefficients with Burg order equal to 4
correlation(): correlation coefficient between two signals
maxInds(): index of the frequency component with largest magnitude
meanFreq(): Weighted average of the frequency components to obtain a mean frequency
skewness(): skewness of the frequency domain signal 
kurtosis(): kurtosis of the frequency domain signal 
bandsEnergy(): Energy of a frequency interval within the 64 bins of the FFT of each window.
angle(): Angle between to vectors.

Additional vectors obtained by averaging the signals in a signal window sample. These are used on the angle() variable:

gravityMean
tBodyAccMean
tBodyAccJerkMean
tBodyGyroMean
tBodyGyroJerkMean

FINAL TIDY SET CREATED

In the final set created by the script there are two variables at the beginning named "activity_name" and "volunteer_num" they refer to the kind of activity the each person
was undergoing at the time of measurement (walking,walking_upstairs,walking_downstairs,sitting,standing,laying) and the number of the person ranging from 1 to 30. The following
86 variables start with "ave_" to state that what is measured in this dataset is the average of the relevant variable from the original datasets. So, the full list of
variables is:

1	activity_name
2	volunteer_num
3	ave_tBodyAcc-mean()-X
4	ave_tBodyAcc-mean()-Y
5	ave_tBodyAcc-mean()-Z
6	ave_tBodyAcc-std()-X
7	ave_tBodyAcc-std()-Y
8	ave_tBodyAcc-std()-Z
9	ave_tGravityAcc-mean()-X
10	ave_tGravityAcc-mean()-Y
11	ave_tGravityAcc-mean()-Z
12	ave_tGravityAcc-std()-X
13	ave_tGravityAcc-std()-Y
14	ave_tGravityAcc-std()-Z
15	ave_tBodyAccJerk-mean()-X
16	ave_tBodyAccJerk-mean()-Y
17	ave_tBodyAccJerk-mean()-Z
18	ave_tBodyAccJerk-std()-X
19	ave_tBodyAccJerk-std()-Y
20	ave_tBodyAccJerk-std()-Z
21	ave_tBodyGyro-mean()-X
22	ave_tBodyGyro-mean()-Y
23	ave_tBodyGyro-mean()-Z
24	ave_tBodyGyro-std()-X
25	ave_tBodyGyro-std()-Y
26	ave_tBodyGyro-std()-Z
27	ave_tBodyGyroJerk-mean()-X
28	ave_tBodyGyroJerk-mean()-Y
29	ave_tBodyGyroJerk-mean()-Z
30	ave_tBodyGyroJerk-std()-X
31	ave_tBodyGyroJerk-std()-Y
32	ave_tBodyGyroJerk-std()-Z
33	ave_tBodyAccMag-mean()
34	ave_tBodyAccMag-std()
35	ave_tGravityAccMag-mean()
36	ave_tGravityAccMag-std()
37	ave_tBodyAccJerkMag-mean()
38	ave_tBodyAccJerkMag-std()
39	ave_tBodyGyroMag-mean()
40	ave_tBodyGyroMag-std()
41	ave_tBodyGyroJerkMag-mean()
42	ave_tBodyGyroJerkMag-std()
43	ave_fBodyAcc-mean()-X
44	ave_fBodyAcc-mean()-Y
45	ave_fBodyAcc-mean()-Z
46	ave_fBodyAcc-std()-X
47	ave_fBodyAcc-std()-Y
48	ave_fBodyAcc-std()-Z
49	ave_fBodyAcc-meanFreq()-X
50	ave_fBodyAcc-meanFreq()-Y
51	ave_fBodyAcc-meanFreq()-Z
52	ave_fBodyAccJerk-mean()-X
53	ave_fBodyAccJerk-mean()-Y
54	ave_fBodyAccJerk-mean()-Z
55	ave_fBodyAccJerk-std()-X
56	ave_fBodyAccJerk-std()-Y
57	ave_fBodyAccJerk-std()-Z
58	ave_fBodyAccJerk-meanFreq()-X
59	ave_fBodyAccJerk-meanFreq()-Y
60	ave_fBodyAccJerk-meanFreq()-Z
61	ave_fBodyGyro-mean()-X
62	ave_fBodyGyro-mean()-Y
63	ave_fBodyGyro-mean()-Z
64	ave_fBodyGyro-std()-X
65	ave_fBodyGyro-std()-Y
66	ave_fBodyGyro-std()-Z
67	ave_fBodyGyro-meanFreq()-X
68	ave_fBodyGyro-meanFreq()-Y
69	ave_fBodyGyro-meanFreq()-Z
70	ave_fBodyAccMag-mean()
71	ave_fBodyAccMag-std()
72	ave_fBodyAccMag-meanFreq()
73	ave_fBodyBodyAccJerkMag-mean()
74	ave_fBodyBodyAccJerkMag-std()
75	ave_fBodyBodyAccJerkMag-meanFreq()
76	ave_fBodyBodyGyroMag-mean()
77	ave_fBodyBodyGyroMag-std()
78	ave_fBodyBodyGyroMag-meanFreq()
79	ave_fBodyBodyGyroJerkMag-mean()
80	ave_fBodyBodyGyroJerkMag-std()
81	ave_fBodyBodyGyroJerkMag-meanFreq()
82	ave_angle(tBodyAccMean,gravity)
83	ave_angle(tBodyAccJerkMean),gravityMean)
84	ave_angle(tBodyGyroMean,gravityMean)
85	ave_angle(tBodyGyroJerkMean,gravityMean)
86	ave_angle(X,gravityMean)
87	ave_angle(Y,gravityMean)
88	ave_angle(Z,gravityMean)


