#set current directory
setwd("F:\\coursera\\clean_data\\week_1")


#read data
activity_lab<- read.table( "UCI HAR Dataset\\activity_labels.txt", header=FALSE)

test_x<-read.table("UCI HAR Dataset\\test\\X_test.txt")
test_y<-read.table("UCI HAR Dataset\\test\\y_test.txt")
train_x<-read.table("UCI HAR Dataset\\train\\X_train.txt")
train_y<-read.table("UCI HAR Dataset\\train\\y_train.txt")
feat_info<-read.table("UCI HAR Dataset\\features.txt")


#add name for every column
names(train_x)<-feat_info[,2]
names(test_x)<-feat_info[,2]
names(train_y)<-c("activity_lab")
names(test_y)<-c("activity_lab")


#join the train and test data, include the label
data_train<-cbind(train_x,train_y)
data_test<-cbind(test_x,test_y)
data_set<-rbind(data_train,data_test)


#write the mean of data_set for every column 
names(data_set_mean) <- names(data_set)
write.table(data_set_mean,"data_mean_set.txt",row.name=FALSE)


#get the modal analysis for the activity name
table(data_set[,562])



#get the mean and  standard deviation for the data_set
colMeans(data_set)
data_sd <- array()
 for(i in 1:dim(data_set)[2]) data_sd[i] <-  sd(data_set[,i])