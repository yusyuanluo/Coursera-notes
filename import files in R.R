###create data directory if it doesn't exist 
if(!file.exists("[filename]")){dir.create("[filename]")}

###download files 
download.file(fileurl, destfile = "[file name]", method='curl')
--------
###xlsx files
library(xlsx)
data<-read.xlsx("[file path]", sheetIndex=1, header=TRUE)
###read specific rows and columns
colIndex <-2:3
rowIndex <- 1:4
datasubset<-read.xlsx("[file path]", sheetIndex=1, colIndex=colIndex, rowIndex=rowIndex)
###other packages can be used to manipulating excel files
#XLConnect package

--------
###XML file
library(XML)
fileurl<-""
doc<-xmlTreeParse(fileurl, useInternalNodes = TRUE)
rootnode<-xmlRoot(doc)

rootnode[[1]] ##first element 
rootnode[[1]][[1]] ##first subelement of the first element

xmlSApply(rootnode, xmlValue) ## extract values
xpathSApply(rootnode, "//name", xmlValue) ##extract the values of specific items

-------
###HTML file
fileurl<-""
doc<-htmlTreeParse(fileurl, useinternal=TRUE)
-------
###Json file
library(jsonlite)
jsondata<-fromJSON("[link]")

##write data frames to JSON
myjson<-toJSON(iris, pretty=TRUE)
cat(myjson)

##convert back to JSON
iris2<-fromJSON(myjson)

##using data.table
library(data.table)
DF=data.frame(x,y,z)

##system time
system.time()
