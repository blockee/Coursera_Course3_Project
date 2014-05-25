## reads features.txt file for variable and column names
variable.names <- read.table("features.txt", stringsAsFactors = FALSE)$V2
## creates a logical list to identify meand and std values, meanFreq excluded
column.chooser <- grepl("mean()", variable.names, fixed = TRUE) |
        grepl("std()", variable.names, fixed = TRUE)
## reads test data, selcets only columns with mean or std values,
## then combines with activity and subject
test.data <- read.table("X_test.txt", col.names = variable.names)
test.data <- test.data[, column.chooser]
test.data <- cbind(read.table("Y_test.txt", col.names = "activity"), test.data)
test.data <- cbind(read.table("subject_test.txt", col.names = "subject")
                   , test.data)
## same process for the train data
train.data <- read.table("X_train.txt", col.names = variable.names)
train.data <- train.data[, column.chooser]
train.data <- cbind(read.table("Y_train.txt", col.names="activity"), train.data)
train.data <- cbind(read.table("subject_train.txt", col.names = "subject")
                    , train.data)
## binds the train and test data
full.data <- rbind(train.data, test.data)
## summarizes the full data set by subject and activity then sorts
summary.data <- aggregate(. ~ subject + activity, data = full.data, mean)
summary.data<-summary.data[order(summary.data$subject, summary.data$activity), ]
## creates an activity list then loops through and replaces activity
## numbers with descriptive names
activity.names <- (c("walking", "walkingupstairs", "walkingdownstairs", 
                    "sitting", "standing", "laying"))
for (i in 1:6){
        summary.data$activity <- replace(summary.data$activity,
                summary.data$activity == i, activity.names[i])
}
## changes variable names to all lower case and removes dots
names(summary.data) <- tolower(names(summary.data))
names(summary.data) <- gsub(".", "", names(summary.data), fixed = TRUE)
## writes the tidy data set in the working directory
write.table(summary.data, "course_project_tidy_data.txt")






