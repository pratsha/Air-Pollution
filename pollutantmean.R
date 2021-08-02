pollutantmean<-function(directory,pollutant,id){
  
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
   
    specData<-rbind(specData,specDataMonitorId)
   
    
  }
  
  iPollutant=0
  for (variable in colnames(specData)) {
    iPollutant=iPollutant+1
    if(variable==pollutant)
    {
      break
    }
  }
  print(iPollutant)
  print(specData[,iPollutant][!is.na(specData[,iPollutant])])
  mean(specData[,iPollutant][!is.na(specData[,iPollutant])])
}