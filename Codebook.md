Code Book
========================================================

This file contains Code Book documentation for the May 2014 class project of the third "Getting and Cleaning Data" course, part of the Johns Hopkins University Data Science Specialization series on Coursera.  The purpose of the project is to demonstrate ability to collect, work with, and clean a data set, and prepare tidy data that can be used for later analysis. The Code Book must describe the variables, the data, and any transformations or work that performed to clean up the data. 


The associated scripts are in an R file called run_analysis.R, and an explanation of how the scripts work and how they are connected is in an accompanying README.md file.   

Study Design Section
-------------------------
This section describes the input data, the methods of extraction, and summarization.  

### Input Data

The input data were derived from Samsung Galaxy S smartphone accelerometer and gyroscope measurements in a study of individuals engaged in different types of physical activity.  Thirty subjects were video-documented engaging in six different types of simple activities (sitting, standing, walking upstairs, etc.) with the smartphones attached to their waists.  

For each set of measurements, 561 corresponding attributes were generated via data processing and transformation, and compiled into a 561 component feature vector, with each feature listed in a separate data column in a single table.  The measurements were separated by subject into two groups, with data from 21 subjects assigned to the training set (for machine classifier training) and data from the other nine subjects assigned to the test set.  

Further information on the dataset can be found at the following sources:
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 
http://www.icephd.org/sites/default/files/IWAAL2012.pdf

The dataset can be downloaded from the following link:
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 


### Extraction Methods

Details on the code used to extract and transform the input dataset are contained in the associated README.md file.  

The extraction proceeded through the following steps:

1. The training and test sets were combined, with data from the training set comprising the first 7352 rows, and data from the test set comprising the final 2947 rows, for a total of 10299 rows. 

2. The feature names (described in the Code Book section below) were added to the table, with whitespace, punctuation marks, and parentheses removed. Identifier components within the labels that were in lower case were changed to first letter upper case (e.g., "mean"  changed to "Mean"), to facilitate human readability.  

3.  Subject indices, which were stored in separate files from the measurement data (see README for details), were added to the table to create a new first column.  

4.  Activity indices for each row were replaced with the corresponding activity names (see Code Book section below), and were added to the table  create a new second column. 

### Summarization

1. In accordance with the application instructions, "measurements on the mean and standard deviation for each measurement," contained in 66 of the original 561 feature data columns, were extracted to create a new table.  

2.  For each of the 66 feature variables, the mean was calculated for each subject and each activity, corresponding to 180 different measurements for each feature.  

3.  The data were saved in a file called "tidy.txt," which is a space-delimited text file containing a table with 68 columns (one column for subjects, one column for activities, and 66 columns for feature data) and 180 rows (one for each subject-activity pair).

Code Book Section
-------------------------
This section of the Code Book is called the Code Book section, per the project instructions.  It describes each variable, along with its units, for the extracted dataset described above, which is contained in the file "tidy.txt"

### Subject and Activity

The first column in the table contains indices for each of the 30 participant subjects, in a column titled "Subject," with integer values ranging from 1 to 30.  

The second column contains physical activity identifiers, which are as follows:

| Activity          |
|-------------------|
| Laying            |
| Sitting           |
| Standing          |
| Walking           |
| WalkingDownstairs |
| WalkingUpstairs   |


### Feature Variables

For the attribute feature variables, the primary measurements from the accelerometer were calculated in standard gravity units ('g'), and the gyroscope angular velocity measurements were calculated in radians per second.  For each attribute in the feature vector, data in the input dataset had been normalized and bounded within a range of [-1,1], so the units are expressed as proportions of max/min.  

Directional components of the accelerometer signal (X,Y,Z) were reported separately, and a lowpass filter was used to separate the component of the gyroscope signal attributable to gravity from the signal attributed to body movement.  Time domain measurements were Fourier transformed for separate reporting in the frequency domain.

### Feature Label Components

Per the instructions from the course video lectures, puctuation and whitespace were removed from the feature and activity labels.  To facilitate human readability, first letter capitalization was used for the identifying components within each label.  

The following key describes each of the identifying components.

| Identifier | Description                                                                             |
|------------|-----------------------------------------------------------------------------------------|
| Time/Freq  | Readouts in the time domain ("t") or in the frequency ("f") Fourier transformed domain. |
| Body       | Component of the gyroscope signal attributable to body movement                         |
| Gravity    | Component of the gyroscope signal attributed to gravity.                                |
| Acc        | Accelerometer measurement                                                               |
| Gyro       | Gyroscope measurement                                                                   |
| Jerk       | First derivative of the acceleration measurement (rate of change in acceleration)       |
| Coord      | X,Y,Z directional components of the signal                                              |
| Mag        | Euclidian norm of the three directional signal components                               |
| Mean       | Mean value of the measurement                                                           |
| Std        | Standard Deviation of the measurement                                                   |


### Feature Labels


The following table lists each of the attribute features, with corresponding information on its identifying components.  For more information on the features and the way they were collected, see the references listed at the beginning of this document.  


| Feature Label            | Time/Freq  | Acc/Gyro | Body/Gravity | Jerk | Mean/Std | Coord/Mag |
|--------------------------|------------|----------|--------------|------|----------|-----------|
| tBodyAccMeanX            | t          | Acc      | Body         |      | Mean     | X         |
| tBodyAccMeanY            | t          | Acc      | Body         |      | Mean     | Y         |
| tBodyAccMeanZ            | t          | Acc      | Body         |      | Mean     | Z         |
| tBodyAccStdX             | t          | Acc      | Body         |      | Std      | X         |
| tBodyAccStdY             | t          | Acc      | Body         |      | Std      | Y         |
| tBodyAccStdZ             | t          | Acc      | Body         |      | Std      | Z         |
| tGravityAccMeanX         | t          | Acc      | Gravity      |      | Mean     | X         |
| tGravityAccMeanY         | t          | Acc      | Gravity      |      | Mean     | Y         |
| tGravityAccMeanZ         | t          | Acc      | Gravity      |      | Mean     | Z         |
| tGravityAccStdX          | t          | Acc      | Gravity      |      | Std      | X         |
| tGravityAccStdY          | t          | Acc      | Gravity      |      | Std      | Y         |
| tGravityAccStdZ          | t          | Acc      | Gravity      |      | Std      | Z         |
| tBodyAccJerkMeanX        | t          | Acc      | Body         | Jerk | Mean     | X         |
| tBodyAccJerkMeanY        | t          | Acc      | Body         | Jerk | Mean     | Y         |
| tBodyAccJerkMeanZ        | t          | Acc      | Body         | Jerk | Mean     | Z         |
| tBodyAccJerkStdX         | t          | Acc      | Body         | Jerk | Std      | X         |
| tBodyAccJerkStdY         | t          | Acc      | Body         | Jerk | Std      | Y         |
| tBodyAccJerkStdZ         | t          | Acc      | Body         | Jerk | Std      | Z         |
| tBodyGyroMeanX           | t          | Gyro     | Body         |      | Mean     | X         |
| tBodyGyroMeanY           | t          | Gyro     | Body         |      | Mean     | Y         |
| tBodyGyroMeanZ           | t          | Gyro     | Body         |      | Mean     | Z         |
| tBodyGyroStdX            | t          | Gyro     | Body         |      | Std      | X         |
| tBodyGyroStdY            | t          | Gyro     | Body         |      | Std      | Y         |
| tBodyGyroStdZ            | t          | Gyro     | Body         |      | Std      | Z         |
| tBodyGyroJerkMeanX       | t          | Gyro     | Body         | Jerk | Mean     | X         |
| tBodyGyroJerkMeanY       | t          | Gyro     | Body         | Jerk | Mean     | Y         |
| tBodyGyroJerkMeanZ       | t          | Gyro     | Body         | Jerk | Mean     | Z         |
| tBodyGyroJerkStdX        | t          | Gyro     | Body         | Jerk | Std      | X         |
| tBodyGyroJerkStdY        | t          | Gyro     | Body         | Jerk | Std      | Y         |
| tBodyGyroJerkStdZ        | t          | Gyro     | Body         | Jerk | Std      | Z         |
| tBodyAccMagMean          | t          | Acc      | Body         |      | Mean     | Mag       |
| tBodyAccMagStd           | t          | Acc      | Body         |      | Std      | Mag       |
| tGravityAccMagMean       | t          | Acc      | Gravity      |      | Mean     | Mag       |
| tGravityAccMagStd        | t          | Acc      | Gravity      |      | Std      | Mag       |
| tBodyAccJerkMagMean      | t          | Acc      | Body         |      | Mean     | Mag       |
| tBodyAccJerkMagStd       | t          | Acc      | Body         |      | Std      | Mag       |
| tBodyGyroMagMean         | t          | Gyro     | Body         |      | Mean     | Mag       |
| tBodyGyroMagStd          | t          | Gyro     | Body         |      | Std      | Mag       |
| tBodyGyroJerkMagMean     | t          | Gyro     | Body         |      | Mean     | Mag       |
| tBodyGyroJerkMagStd      | t          | Gyro     | Body         |      | Std      | Mag       |
| fBodyAccMeanX            | f          | Acc      | Body         |      | Mean     | X         |
| fBodyAccMeanY            | f          | Acc      | Body         |      | Mean     | Y         |
| fBodyAccMeanZ            | f          | Acc      | Body         |      | Mean     | Z         |
| fBodyAccStdX             | f          | Acc      | Body         |      | Std      | X         |
| fBodyAccStdY             | f          | Acc      | Body         |      | Std      | Y         |
| fBodyAccStdZ             | f          | Acc      | Body         |      | Std      | Z         |
| fBodyAccJerkMeanX        | f          | Acc      | Body         | Jerk | Mean     | X         |
| fBodyAccJerkMeanY        | f          | Acc      | Body         | Jerk | Mean     | Y         |
| fBodyAccJerkMeanZ        | f          | Acc      | Body         | Jerk | Mean     | Z         |
| fBodyAccJerkStdX         | f          | Acc      | Body         | Jerk | Std      | X         |
| fBodyAccJerkStdY         | f          | Acc      | Body         | Jerk | Std      | Y         |
| fBodyAccJerkStdZ         | f          | Acc      | Body         | Jerk | Std      | Z         |
| fBodyGyroMeanX           | f          | Gyro     | Body         |      | Mean     | X         |
| fBodyGyroMeanY           | f          | Gyro     | Body         |      | Mean     | Y         |
| fBodyGyroMeanZ           | f          | Gyro     | Body         |      | Mean     | Z         |
| fBodyGyroStdX            | f          | Gyro     | Body         |      | Std      | X         |
| fBodyGyroStdY            | f          | Gyro     | Body         |      | Std      | Y         |
| fBodyGyroStdZ            | f          | Gyro     | Body         |      | Std      | Z         |
| fBodyAccMagMean          | f          | Acc      | Body         |      | Mean     | Mag       |
| fBodyAccMagStd           | f          | Acc      | Body         |      | Std      | Mag       |
| fBodyBodyAccJerkMagMean  | f          | Acc      | Body Body    | Jerk | Mean     | Mag       |
| fBodyBodyAccJerkMagStd   | f          | Acc      | Body Body    | Jerk | Std      | Mag       |
| fBodyBodyGyroMagMean     | f          | Gyro     | Body Body    |      | Mean     | Mag       |
| fBodyBodyGyroMagStd      | f          | Gyro     | Body Body    |      | Std      | Mag       |
| fBodyBodyGyroJerkMagMean | f          | Gyro     | Body Body    | Jerk | Mean     | Mag       |
| fBodyBodyGyroJerkMagStd  | f          | Gyro     | Body Body    | Jerk | Std      | Mag       |







