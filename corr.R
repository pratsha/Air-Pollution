corr<-function(directory,threshold=0){
  source("complete.R")
  
  check=complete(directory)
  
  x=subset(check,check[,2]>threshold)
  
  specData=NULL
  for (monitorId in x[,1]) {
    
    monitorIdUpdate=monitorId
    while(nchar(monitorIdUpdate)<3)
    {
      monitorIdUpdate=paste("0",monitorIdUpdate,sep = "")
    }
    
    path<-paste(getwd(),"/",directory,"/",monitorIdUpdate,".csv",sep="")
    specDataMonitorId=read.csv(path,header = TRUE)
    
    countComplete<-specDataMonitorId[complete.cases(specDataMonitorId),]
    specData<-rbind(specData,cor(countComplete$sulfat,countComplete$nitrate))
     
    
  }
  specData

  
}