complete<-function(directory, id=1:332){
  
  specData=NULL
  
  for (monitorId in id) {
    
    monitorIdUpdate=monitorId
    while(nchar(monitorIdUpdate)<3)
    {
      monitorIdUpdate=paste("0",monitorIdUpdate,sep = "")
    }
    
    path<-paste(getwd(),"/",directory,"/",monitorIdUpdate,".csv",sep="")
    print(path)
    specDataMonitorId=read.csv(path,header = TRUE)
    
    countComplete<-specDataMonitorId[complete.cases(specDataMonitorId),]
    
    specData<-rbind(specData,c(monitorId,nrow(countComplete)))
  
    
  }
  colnames(specData)<-c("ID","nobs")
  print(specData)
}