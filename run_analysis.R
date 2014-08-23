library(plyr)

# Quick check if we have downloaded the files
dataDirectory <- "UCI HAR Dataset"
if(!file.exists(dataDirectory)) {
  stop(c("Please put the files into the following directory: ",getwd(),"/",dataDirectory))
}



activityLabels <- read.table('UCI HAR Dataset/activity_labels.txt', header= FALSE, col.names=c("ID","Description"))

## Read and merge the subject and activities
subjects <- rbind(
  read.table(paste(dataDirectory,'/train/subject_train.txt',sep=""), header=FALSE),
  read.table(paste(dataDirectory,'/test/subject_test.txt',sep=""), header=FALSE)
)

activities <- rbind(
  read.table(paste(dataDirectory,'/train/y_train.txt',sep=""), header=FALSE),
  read.table(paste(dataDirectory,'/test/y_test.txt',sep=""), header=FALSE)
)

# Read and merge the measurements, with only the features we need
features <- read.table(paste(dataDirectory,"/features.txt",sep=""),
                       header=FALSE,
                       col.names=c("ID","Name"))

# We create a logical vector with variables that contain either mean() or std()
colClasses <- grepl("mean\\(\\)",features$Name) | grepl("std\\(\\)",features$Name)

# We get the features that we want
filteredFeatures <- features$Name[colClasses]

# Construct colClasses with NULL where we want to skip the columns
colClasses[colClasses == TRUE] <- NA
colClasses[colClasses == FALSE] <- "NULL"

# Read & merge the datasets
measurements <- rbind(
  read.table(paste(dataDirectory,'/train/X_train.txt',sep=""),header=FALSE,colClasses = colClasses),
  read.table(paste(dataDirectory,'/test/X_test.txt',sep=""),header=FALSE,colClasses = colClasses)
)

colnames(measurements) <- filteredFeatures
measurements <- cbind(activity = activities$V1, measurements)
measurements <- cbind(subject = subjects$V1, measurements)
# replace stuff
measurements$activity <- activityLabels$Description[measurements$activity]

output <- ddply(measurements, .(subject,activity), numcolwise(mean))

#tidy <- subjectsColumn
#tidy <- cbind(activitiesColumn$V1, tidy)
##colnames(tidy) <- filteredFeatures$V2