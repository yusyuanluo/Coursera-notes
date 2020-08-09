library(XML)
library(httr)
fileurl<-'https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Frestaurants.xml'
r = GET(fileurl)

doc<-xmlTreeParse(r, useInternal = TRUE)

rootnode<-xmlRoot(doc)

a<-xpathSApply(rootnode, "//zipcode", xmlValue)
b<-table(a)
b[names(a)==21231]

##5

fileurl<-'https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06pid.csv'
download.file(fileurl, destfile = "MD survey.csv", method='curl')
library(data.table)
DT<-fread("MD survey.csv", sep=',', header = TRUE)

##choice1
start_time <- Sys.time()
system.time(mean(DT$pwgtp15, by =DT$SEX))
end_time <- Sys.time()
end_time - start_time
##0.01094913


###choice 2

start_time <- Sys.time()
tapply(DT$pwgtp15, DT$SEX,mean)
end_time <- Sys.time()
end_time - start_time
##0.01113605

##choice 3
start_time <- Sys.time()
sapply(split(DT$pwgtp15,DT$SEX),mean)
end_time <- Sys.time()
end_time - start_time
##0.01562619

##choice 4
start_time <- Sys.time()
DT[,mean(pwgtp15), by=SEX]
end_time <- Sys.time()
end_time - start_time
##0.01207

##choice 5
start_time <- Sys.time()
mean(DT[DT$SEX==1,]$pwgtp15)
mean(DT[DT$SEX==2,]$pwgtp15)
end_time <- Sys.time()
end_time - start_time
##0.02098799

##choice 6
start_time <- Sys.time()
rowMeans(DT)[DT$SEX==1]
rowMeans(DT)[DT$SEX==2]
     end_time <- Sys.time()
     end_time - start_time
##2.154184
