# coursera-data-cleaning-project
This is the course project of https://class.coursera.org/getdata-011/ (Getting and Cleaning Data) on Coursera.com

The script uses data from:
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones
==================================================================
Human Activity Recognition Using Smartphones Dataset
Version 1.0
==================================================================
[1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012
==================================================================


As long as it is placed INSIDE the unzipped UCI HAR Dataset folder, it will pull the files it needs and work.

It follows the following steps:
It pulls the testing and training data sets as data.frames and joins them using the rbind command.

It also pulls the activity and subject label files and joins them to the dataset using the cbind command.

It then uses the features.txt file available in the data folder to name the variables
(as well as using the hard-coded "Subject" and "Activity" variable names)

Then it removes all the column variables except the Subject, Activity and those 
with the words "mean", "std" in the column names.

Using this we rename the "Activity" column values to the appropriate activity name using the 
information in the "Activity_labels.txt" file in the dataset.

Then, it calls the plyr library and uses ddply to summarize and average the data by subject and by activity. It leaves the original column names intact for easy reference based on the dataset README.

Finally, it uses write.table to create a tidy.txt file with the cleaned and averaged data that we wanted. 


