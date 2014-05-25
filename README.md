Readme
========================================================

This file contains readme documentation for the file run_analysis.R, which was written in May 
2014 for the third "Getting and Cleaning Data" course, part of the Johns Hopkins 
University Data Science Specialization series on Coursera.  The purpose of the script is
to produce a "tidy" data summary table, from an input dataset used for classifier training 
and testing to recognize different types of human physical activity recorded on cellphones.  Information on the dataset can be obtained at the following link:

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 

For more information on the data transformations and features, see the accompanying codebook 
documentation file posted at the following Github link:

https://github.com/anon-coursera-user/GetandCleanData/blob/master/Codebook.md

### Code requirements

The script was written using RStudio with R version 3.0.3.  It requires installation of 
the reshape2 package. 
 
The file run_analysis.R should be placed in the R working directory and run with the 
following command:

source("run_analysis.R")

### Required Inputs

The required input files can be found at the following location:
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

The following files must be uncompressed and moved from their associated subdirectories 
to the R working directory, alongside the run_analysis.R file. 

Input Files|
------------- | -------------
activity_labels.txt |  
features.txt |  
features_info.txt  |  
X_train.txt  |
X_test.txt |
y_train.txt |
y_test.txt |
subject_train.txt  |
subject_test.txt  |  

### Outputs

The script produces a table of transformed data, which is saved in the R Working Directory 
as a space-delimited text file called "tidy.txt."  For details on the data transformations 
and the table organization, see the accompanying Codebook.  

The script also produces the following R objects. 


| Object           | Description                                                                                                                                                                                                                                                                                                           |   |
|------------------|-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|---|
|  "Xdata"         | Combined input files "X_train.txt" and "X_test.txt"                                                                                                                                                                                                                                                                   |   |
|  "featNames"     | Table of input variable types from the input file "features.txt"                                                                                                                                                                                                                                                      |   |
|  "featMean"      | Subset of the input data with mean values of input measures                                                                                                                                                                                                                                                           |   |
|  "featStd"       | Subset of the input data with standard deviation values of input measures                                                                                                                                                                                                                                             |   |
|  "DataSet"       | Subset of the input data used to create the final table, created by  combining "featMean" and "featStd", and adding columns for participant subject and type of physical activity.                                                                                                                                    |   |
|  "names"         | Temporary object used to clean the feature names in the final table                                                                                                                                                                                                                                                   |   |
|  "SubjData"      | Listing of study participant subject identifiers for each row of input data, taken by combining the input files "subject_train.txt" and "subject_test.txt"                                                                                                                                                            |   |
|  "ActData"       | Listing of physical activity type for each row of input data, taken by  combining the input files "y_train.txt" and "y_test.txt" and  replacing activity index number with corresponding activity label.                                                                                                              |   |
|  "ActLabels"     | Table of labels for the types of physical activity in the dataset, from  the input file "activity_labels.txt"                                                                                                                                                                                                         |   |
|  "i"             | Temporary object for replacing physical activity indices with labels.                                                                                                                                                                                                                                                 |   |
|  "moltenDataSet" | Transformed "long" table (with few columns and many rows) corresponding to "DataSet," which is a "wide" table with many columns and correspondingly fewer rows.  For more information on the transformation, consult the R documentation for the reshape2 package  (http://cran.r-project.org/web/packages/reshape2/) |   |
|  "recastDataSet" | Final data transformation table, corresponding to the output file  "tidy.txt"  See Codebook for information on the table.                                                                                                                                                                                             |   |



