Code Book for 'tidy' dataset

There are two variables in 'tidy' that are used for identification: 
1. "subject"
2. "activity"

"subject" is an integer variable with values 1-30 that represents an individual that has been observed.
"activity" is a character variable with values that represent six different activities that have been measured.

        The six different activities are:
        1. Laying
        2. Sitting
        3. Standing
        4. Walking
        5. Walking Downstairs
        6. Walking Upstairs

There are 79 variables that measure each activity for each subject.  The original dataset used had several hundred observations for each subject in each activity type.  The data was reshaped using the "reshape2" package in R to show the average of each variable for every activity type.  For example, the first measure variable "tbodyaccm" was observerd 302 times for subject 2.  The activity 'standing' appeared 31 times and the data was reshaped to calculate the average of "tbodyaccm" for the factor 'standing'.  

The original data consisted of six different text files that were further separated by "test" and "train" folders.  I imported the data and merged all data sets into one.  I then extracted only the variables that contained the mean or standard deviation in their column heading.  Next, I replaced the integer coding in the "activity" variable to be more descriptive based on the 'activity_labels.txt' file and cleaned up the headers by removing extraneous characters such as ".", "-", and "()".

The final lines of code create a tidy dataset and writes the data to a .csv file.  I converted the .csv file to a pdf document in my directory.