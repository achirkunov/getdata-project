# CodeBook

## Assumptions
We assume that the files are inside the "UCI HAR Dataset" folder inside the working directory.

## Transformations
We have merged the test & train datasets, and replaced activity ID's by activity description.

Also, we are only keeping any columns which contains mean() or std(), and have then
removed any special punctuation (hyphen, comma, etc).

If there were multiple measurments per subject/activity pair, then mean of the measurements was taken.

## Variables
subject The ID of the subject doing the activity

activity The activity that the subject has been doing, either WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING

tbodyaccmeanx

tbodyaccmeany

tbodyaccmeanz

tbodyaccstdx

tbodyaccstdy

tbodyaccstdz

tgravityaccmeanx

tgravityaccmeany

tgravityaccmeanz

tgravityaccstdx

tgravityaccstdy

tgravityaccstdz

tbodyaccjerkmeanx

tbodyaccjerkmeany

tbodyaccjerkmeanz

tbodyaccjerkstdx

tbodyaccjerkstdy

tbodyaccjerkstdz

tbodygyromeanx

tbodygyromeany

tbodygyromeanz

tbodygyrostdx

tbodygyrostdy

tbodygyrostdz

tbodygyrojerkmeanx

tbodygyrojerkmeany

tbodygyrojerkmeanz

tbodygyrojerkstdx

tbodygyrojerkstdy

tbodygyrojerkstdz

tbodyaccmagmean

tbodyaccmagstd

tgravityaccmagmean

tgravityaccmagstd

tbodyaccjerkmagmean

tbodyaccjerkmagstd

tbodygyromagmean

tbodygyromagstd

tbodygyrojerkmagmean

tbodygyrojerkmagstd

fbodyaccmeanx

fbodyaccmeany

fbodyaccmeanz

fbodyaccstdx

fbodyaccstdy

fbodyaccstdz

fbodyaccjerkmeanx

fbodyaccjerkmeany

fbodyaccjerkmeanz

fbodyaccjerkstdx

fbodyaccjerkstdy

fbodyaccjerkstdz

fbodygyromeanx

fbodygyromeany

fbodygyromeanz

fbodygyrostdx

fbodygyrostdy

fbodygyrostdz

fbodyaccmagmean

fbodyaccmagstd

fbodybodyaccjerkmagmean

fbodybodyaccjerkmagstd

fbodybodygyromagmean

fbodybodygyromagstd

fbodybodygyrojerkmagmean

fbodybodygyrojerkmagstd