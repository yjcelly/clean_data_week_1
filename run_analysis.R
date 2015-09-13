setwd("F:\\coursera\\clean_data\\week_1")

activity_lab<- read.table( "UCI HAR Dataset\\activity_labels.txt", header=FALSE)

test_x<-read.table("UCI HAR Dataset\\test\\X_test.txt")
test_y<-read.table("UCI HAR Dataset\\test\\y_test.txt")
train_x<-read.table("UCI HAR Dataset\\train\\X_train.txt")
train_y<-read.table("UCI HAR Dataset\\train\\y_train.txt")
feat_info<-read.table("UCI HAR Dataset\\features.txt")



names(train_x)<-feat_info[,2]
names(test_x)<-feat_info[,2]
names(train_y)<-c("activity_lab")
names(test_y)<-c("activity_lab")



data_train<-cbind(train_x,train_y)
data_test<-cbind(test_x,test_y)

data_set<-rbind(data_train,data_test)


names(data_set_mean) <- names(data_set)
write.table(data_set_mean,"data_mean_set.txt",row.name=FALSE)


table(data_set[,562])



colMeans(data_set)
data_sd <- array()
for(i in 1:dim(data_set)[2]) data_sd[i] <-  sd(data_set[,i])