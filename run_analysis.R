library(dplyr) 
id_test <- read.table("./test/subject_test.txt")
data_test <- read.table("./test/X_test.txt")
activity_test <- read.table("./test/Y_test.txt")
test <- cbind(id_test,data_test,activity_test)

id_train <- read.table("./train/subject_train.txt")
data_train <- read.table("./train/X_train.txt")
activity_train <- read.table("./train/Y_train.txt")
train <- cbind(id_train,data_train,activity_train)
data <- rbind(test,train)

remove(activity_test,activity_train,data_test,data_train,id_test,id_train,test,train)

colnames(data)[c(1,563)] <- c("id","activity")
colnames(data)[2:562] <- as.character(read.table("features.txt")[,2])

data <- data[grep("mean|std|id|activity",colnames(data))]
data <- data[grep("Freq",colnames(data),invert=T)]

activity_labels <- read.table("activity_labels.txt",row.names=1)$V2
data$activity <- factor(data$activity,labels=activity_labels)

cnames <- colnames(data)
cnames <- gsub("-",".",cnames,fix=T)
cnames <- gsub("()","",cnames,fix=T)
cnames <- sub("t","Time.",cnames,fix=T)
cnames <- sub("f","Freq.",cnames,fix=T)
cnames <- sub("sTime.d","std",cnames,fix=T)
cnames <- gsub("BodyBody","Body",cnames,fix=T)
cnames[1] <- "subject.id"
cnames[68] <- "activity"
colnames(data) <- cnames

grouped_data <- group_by(data,subject.id,activity)
output <- summarise_each(grouped_data,funs(mean))

write.table(output,file="tidy_data_set.txt",row.names=F)
