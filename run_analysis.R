
# Reading individual data files
te <- read.table("./test/X_test.txt")
tr <- read.table("./train/X_train.txt")
ye <- read.table("./test/y_test.txt")
yr <- read.table("./train/y_train.txt")
se <- read.table("./test/subject_test.txt")
sr <- read.table("./train/subject_train.txt")

#concatenating individual files
t <- rbind(te,tr)
y <- rbind(ye,yr)
s <- rbind(se,sr)

# concatenating the entire data set to complete project requirement 1
d <- cbind(s,y,t) 

# naming variables by reading in features.txt and then including the "Subject" and "Activity" Names
f <- read.table("features.txt")
names <- c("Subject", "Activity", as.vector(f[,2]))
colnames(d) <- names

# Clearing the variables that don't contain the words "mean" or "std" 
# and adding the Subject and Activity COlumns in
dm <- d[, grep("mean", names(d))]
ds <- d[, grep("std", names(d))]
Subject <- d[, grep("Subject", names(d))]
Activity <- d[, grep("Activity", names(d))]
df <- cbind(Subject, Activity, dm,ds)

# Step 3 for the project - Renaming Activity to be sensible (just like the activity labels)
as.factor(as.character(df$Activity)) -> df$Activity
revalue(df$Activity, c("1" = "WALKING", "2" = "WALKING_UPSTAIRS","3" = "WALKING_DOWNSTAIRS", "4" = "SITTING","5" = "STANDING", "6" = "LAYING")) -> df$Activity


# FInally, Summarizing by subject and activity using ddply from the plyr library
library(plyr)
ddp <- ddply(df, .(Subject, Activity), colwise(mean))

# Write the tidy dataset to a txt file.
write.table(ddp, "tidy.txt",row.name = FALSE)