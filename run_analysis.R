##library("reshape2")
##Read in the column headings
features <- read.table("./features.txt")

##Read in the test data from 3 text files.
xtest <- read.table("./test/X_test.txt")
colnames(xtest) <- features$V2  ##assign column names to the 'xtest' data.

ytest <- read.table("./test/y_test.txt")
colnames(ytest) <- c("activity")  ##assign column name 'activity' to 'ytest' data.

subjtest <- read.table("./test/subject_test.txt")
colnames(subjtest) <- c("subject")  ##assign column name 'subject' to 'subjtest' data.

test <- data.frame(subjtest, ytest, xtest)  ##create a dataframe of all 3 files.
##Repeat these read and renaming steps for the train data below. 

##Read in the train data from 3 text files.
xtrain <- read.table("./train/X_train.txt")
colnames(xtrain) <- features$V2  ##assign column names to the 'xtrain' data.

ytrain <- read.table("./train/y_train.txt")
colnames(ytrain) <- c("activity")

subjtrain <- read.table("./train/subject_train.txt")
colnames(subjtrain) <- c("subject")

##create a dataframe of all 3 files.
train <- data.frame(subjtrain, ytrain, xtrain) 

##combine both dataframes into one big dataset.
bind <- rbind(test, train)  

##subset all variables that have 'mean' or 'std' in their column names.
means <- bind[,grep("mean", names(bind))] ##subsets only the variables that contain mean values based on header
stds <- bind[,grep("std", names(bind))]  ##subsets only the variables that contain standard deviations

bind2 <- data.frame(means, stds)  ##combines all variables that contain mean and std in the header

##adds back the subject and activity variables
bind3 <- data.frame(subject = bind$subject, activity = bind$activity, bind2)  

##find and replace the numeric codes for each activity with a descriptive string
a <- gsub("1", "WALKING", bind3$activity)
a <- gsub("2", "WALKING UPSTAIRS", a)
a <- gsub("3", "WALKING DOWNSTAIRS", a)
a <- gsub("4", "SITTING", a)
a <- gsub("5", "STANDING", a)
a <- gsub("6", "LAYING", a)

##insert the replaced values of the activity variable back into the main dataset
bind4 <- data.frame(subject = bind$subject, activity = a, bind2)

##clean up the names of the header by removing spaces and extra characters.
names(bind4)<-tolower(gsub("[^[:alnum:]]","", names(bind4)))

##Load the 'reshape2' package.  Reshape the data to have subject and activity as the id variables.
##Make all other variables measure variables.
bind4melt <- melt(bind4, id=c("subject", "activity"), measure.vars= 3:81)
meltdata <- dcast(bind4melt, subject + activity ~ variable, mean)

##write the dataframe to a csv file in your working directory.
write.csv(meltdata, file = "tidy.csv")
