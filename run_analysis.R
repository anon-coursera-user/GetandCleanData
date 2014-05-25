# Place this file in the R working directory.  See the README file for required
# inputs, and the Code Book for information on the dataset and associated 
# transformations and variables.  The script requires the reshape2 R package.  
library(reshape2)

# Combine train and test data from the source files; extract the columns
# containing the mean and standard deviation of the source features.
Xdata <- rbind(read.table("X_train.txt"),read.table("X_test.txt"))
featNames <- as.vector(read.table("features.txt")[,2])
names(Xdata) <- featNames
featMean <- intersect(grep("mean",featNames),grep("meanFreq",featNames,invert=TRUE))
featStd <- grep("std",featNames)
DataSet <- Xdata[,sort(c(featMean,featStd))]

# Rename the extracted columns to be consistent with JLeek's instructions and 
# Google code style for R.  [Repeating the same command seems inelegant/inefficient,
# but the other options I explored didn't seem better].
names <- names(DataSet)
names <- gsub("mean","Mean",names)
names <- gsub("std","Std",names)
names <- gsub("-","",names)
names <- gsub("()","",names,fixed=TRUE)
names(DataSet) <- names

# Rename the activity labels using same criteria as feature labels.
ActLabels <- read.table("activity_labels.txt")
ActLabels$V2 <- gsub("_"," ",ActLabels$V2)
ActLabels$V2 <- gsub("\\b([A-Z])([A-Z]+)", "\\U\\1\\L\\2" ,ActLabels$V2, perl=TRUE)
ActLabels$V2 <- gsub(" ", "" ,ActLabels$V2)

# Merge the the subject indices from the train and test datasets; repeat the
# merge for the activity indices, but replace with activity labels. Add as 
# columns 1 and 2 of DataSet.
SubjData <- rbind(read.table("subject_train.txt"),read.table("subject_test.txt"))
ActData <- rbind(read.table("y_train.txt"),read.table("y_test.txt"))
for (i in ActLabels$V1) ActData[ActData == i] <- ActLabels$V2[ActLabels$V1 == i]
names(SubjData) <- "Subject"
names(ActData) <- "Activity"
DataSet <- cbind(SubjData,ActData,DataSet)

# Using the reshape2 melt command, morph the 66 columns of features into a single "Feature" 
# column.  Then recombine the data in summary form, taking the mean of each of the features 
# for each Subject/Activity combination.  
moltenDataSet = melt(DataSet, id = c("Subject", "Activity"), variable.name = "Feature")
recastDataSet <- dcast(moltenDataSet, Subject + Activity ~ Feature, fun.aggregate=mean)

# Export file. 
write.table(recastDataSet, file = "tidy.txt")
                      
