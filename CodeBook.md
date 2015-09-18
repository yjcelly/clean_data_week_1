
#set current directory 
setwd("F:\\coursera\\clean_data\\week_1")


#read the activity label
activity_lab<- read.table( "UCI HAR Dataset\\activity_labels.txt", header=FALSE)

#read the feature and label, include the feature info
test_x<-read.table("UCI HAR Dataset\\test\\X_test.txt")
test_y<-read.table("UCI HAR Dataset\\test\\y_test.txt")
train_x<-read.table("UCI HAR Dataset\\train\\X_train.txt")
train_y<-read.table("UCI HAR Dataset\\train\\y_train.txt")
feat_info<-read.table("UCI HAR Dataset\\features.txt")


#change the label index to activity lable string
test_y$V1=activity_lab[test_y$V1,2]
train_y$V1=activity_lab[train_y$V1,2]


#change the data feature descriptions
names(train_x)<-feat_info[,2]
names(test_x)<-feat_info[,2]
names(train_y)<-c("activity_lab")
names(test_y)<-c("activity_lab")


#combine the train and test data, paste the feature and label
data_train<-cbind(train_x,train_y)
data_test<-cbind(test_x,test_y)

data_set<-rbind(data_train,data_test)


#get the mean and  standard deviation for every kind of feature 
data_mean <- colMeans(data_set[,1:561])
data_sd <- array()
 for(i in 1:(dim(data_set)[2]-1)) data_sd[i] <-  sd(data_set[,i])
 
#copy the data set 
copy_data_set <- data_set
data_tab <- table(copy_data_set[,562])

#create the data frame for the output 
m <- matrix(nrow=dim(data_tab),ncol=562)
out_avg <- data.frame(m)

#set the names of output data frames 
names(out_avg)[1] <- names(copy_data_set)[562]
names(out_avg)[2:562] <- names(copy_data_set)[1:561]

#statistics the mean for every activity lable
for(i in 1:dim(data_tab))
{
	datatmp <-	copy_data_set[copy_data_set$activity_lab == names(data_tab)[i],]

	if( (dim(datatmp)[1] >1 ) &&  (dim(datatmp)[2] >1 )  )
	{
		out_avg[i,2:562] <- colMeans(datatmp[,1:561])
		out_avg[i,1] <- names(data_tab)[i]
	}
}

#write the output data frame 
write.table(out_avg,"data.txt",row.name=FALSE)

