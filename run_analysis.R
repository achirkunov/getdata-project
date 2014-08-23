library(plyr)

activityLabels <- read.table('UCI HAR Dataset/activity_labels.txt', header= FALSE, col.names=c("ID","Description"))

subjectsColumn <- read.table('UCI HAR Dataset/train/subject_train.txt', header=FALSE)
activitiesColumn <- read.table('UCI HAR Dataset/train/y_train.txt', header=FALSE)
#measurementsColumn <- read.table('UCI HAR Dataset/train/X_train.txt', header=FALSE)
features <- read.table('UCI HAR Dataset/features.txt', header=FALSE)


#filteredFeatures <- features$V2[grepl("mean()",features$V2) | grepl("std()",features$V2)]


# We take the features we need and search only for mean() or std()
colClasses <- grepl("mean\\(\\)",features$V2) | grepl("std\\(\\)",features$V2)
# that's the column names
filteredFeatures <- features$V2[colClasses]
# now we construct a vector of NA or NULL to filter
colClasses[colClasses == TRUE] <- NA
colClasses[colClasses == FALSE] <- "NULL"

measurements <- read.table('UCI HAR Dataset/train/X_train.txt',
                           header = FALSE,
                           colClasses = colClasses)
colnames(measurements) <- filteredFeatures
measurements <- cbind(activity = activitiesColumn$V1, measurements)
measurements <- cbind(subject = subjectsColumn$V1, measurements)
# replace stuff
measurements$activity <- activityLabels$Description[measurements$activity]

output <- ddply(measurements, .(subject,activity), numcolwise(mean))

#tidy <- subjectsColumn
#tidy <- cbind(activitiesColumn$V1, tidy)
##colnames(tidy) <- filteredFeatures$V2