analysis <- function(){

dtrainx<-read.table("./X_train.txt")
dtrainy<-read.table("./y_train.txt")
dtrainsub<-read.table("./subject_train.txt")
dtrain_master<- cbind(dtrainx,dtrainy,dtrainsub)

dtestx<-read.table("./X_test.txt")
dtesty<-read.table("./Y_test.txt")
dtestsub<-read.table("./subject_test.txt")
dtest_master<- cbind(dtestx,dtesty,dtestsub)

features<-read.table("./features.txt",stringsAsFactors = FALSE)
activity <-read.table("./activity_labels.txt")
names(activity) <- c("activity","description")

d_final <- rbind(dtrain_master,dtest_master)
names(d_final)[1:561] <- features[,2]
names(d_final)[562:563]<- c("y","subject")

mean_list <- names(d_final)[grep("-mean()",names(d_final))]
mean_pos <- grep("-mean()",mean_list)
exclude_list <- grep("Freq()",mean_list)
pos_vector <- setdiff(mean_pos,exclude_list)

mean_list <- mean_list[c(pos_vector)]
std_list <- names(d_final)[(grep("-std()",names(d_final)))]



final_data <- cbind(d_final[,c(mean_list)],d_final[,c(std_list)],d_final[,562],d_final[,563])

names(final_data)[67:68]<- c("activity","subject")

final_data$activity <- activity[final_data$activity,2]

melted_data <- melt(final_data,id= c("subject","activity"))
casted_data <- dcast(melted_data,subject + activity~ variable,mean)

write.table(casted_data,file = "./tidy_data.txt",sep = "\t",row.names = FALSE)

casted_data




}

