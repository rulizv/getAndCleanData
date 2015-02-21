run_analysis <- function ()
{
    #Auxiliary function to set the descriptive activity names
    changeActivity<- function (yValues){
        dt_Y <- yValues
        dt_Y[dt_Y==1]<-'Walking'
        dt_Y[dt_Y==2]<-'Walking Upstairs'
        dt_Y[dt_Y==3]<-'Walking Downstairs'
        dt_Y[dt_Y==4]<-'Sitting'
        dt_Y[dt_Y==5]<-'Standing'
        dt_Y[dt_Y==6]<-'Laying'
        dt_Y
        
    }
    
    #Read de features observation and extract those that have 
    #mean() and std(). The use of parentheses is important to avoid 
    #catching columns that would have mean as part of the name.
    #Regular expressions are used for matching.
    vFeatures<-read.table('./UCI HAR Dataset/features.txt')
    vSelAux <- grep('mean\\(\\)|std\\(\\)',z[,2])
    vSelFeaturesCols <- vFeatures[vSelAux,1]
    vSelFeaturesNames <- vFeatures[vSelAux,2]
    
    
    
    

    #The code is repeted twice one for the test and one for the train group of files
    
    
    #Load the Subject data set
    dt_st_t <- read.table('./UCI HAR Dataset/test/subject_test.txt')
    colnames(dt_st_t)[1] <-'Subject'
    #Load the Table
    dt_X_t<-read.table('./UCI HAR Dataset/test/X_test.txt')
    #Select the columns for mean() and std() and set meaningful names
    dt_X_t<-dt_X_t[,vSelFeaturesCols]
    colnames(dt_X_t) <- vSelFeaturesNames
    #Read the activity file and change
    dt_Y_t<-read.table('./UCI HAR Dataset/test/Y_test.txt')
    colnames(dt_Y_t)[1] <-'Activity'
    dt_Y_t<-changeActivity(dt_Y_t)
    #A partial data frame for the test data set
    dt_t <- cbind(dt_st_t,dt_Y_t,dt_X_t)
    
    
    dt_st_r <- read.table('./UCI HAR Dataset/train/subject_train.txt')
    colnames(dt_st_r)[1] <-'Subject'
    dt_X_r<-read.table('./UCI HAR Dataset/train/X_train.txt')
    dt_X_r<-dt_X_r[,vSelFeaturesCols]
    colnames(dt_X_r) <- vSelFeaturesNames
    dt_Y_r<-read.table('./UCI HAR Dataset/train/Y_train.txt')
    colnames(dt_Y_r)[1] <-'Activity'
    dt_Y_r<-changeActivity(dt_Y_r)
    #A partial data frame for the test data set
    dt_r <- cbind(dt_st_r,dt_Y_r,dt_X_r)
    
    #Merge the two data sets: test and train
    y <- rbind(dt_t,dt_r)
    
    #Extract the mean of all variable columns
    dt_f <- aggregate(y[,3:ncol(y)],list(y$Subject,y$Activity),mean)
    #Replace the names of the group by colums 
    colnames(dt_f)[1]='Subject'
    colnames(dt_f)[2]='Activity'
    #Write the file called result.txt in the working directory with the tidy data set as requested
    write.table(dt_f,'result.txt',row.name=FALSE)
    #return the data_frame for inmediate use.
    dt_f
}