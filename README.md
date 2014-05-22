The run_analysis.R script requires the "reshape2" package in R.

Download and unzip the following folder into your working directory:
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

Set the working directory to "./UCI HAR Dataset/".

The script will read six files from the unzipped folder into your global environment.
It will extract only the columns that have "mean" and "std" in their column heading and join all six files into one dataframe.

The script will recode the variable "activity" to be descriptive of the activity performed.  It will also clean up the column names by removing characters such as "-", "()", and ".".  

The script will reshape the dataframe to organize by subject and activity, and then provide the means of each measure variable for each subject and activity.   

The final action of the script is to write the tidy dataset to a .csv file called "tidy.csv".   