###Quiz week 2 
#Question1
#install.packages("httr")
#install.packages("httpuv")
#install.packages("jsonlite")
library(httr)
require(httpuv)
require(jsonlite)

oauth_endpoints("github")
myapp <- oauth_app("Coursera", 
                   key = "746ae5c33a78d28fc1dd", 
                   secret = "ac12270e8b3211edc50a2922bb3cab628afe0ace")
github_token <- oauth2.0_token(oauth_endpoints("github"), myapp)
##use authoriation call back url as http://localhost:1410
req<-GET ("https://api.github.com/users/jtleek/repos", config(token=github_token))
stop_for_status(req)
output<-content(req)
jsondata<-fromJSON(toJSON(output))
subset(jsondata, name== "datasharing", select = c(created_at))

#Question 2
install.packages("sqldf")
library(sqldf)
fileurl<-"https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06pid.csv"
download.file(fileurl, destfile = "getdata.csv", method="curl")
acs<-read.csv("getdata.csv")
sqldf("select pwgtp1 from acs")

##Question 3
sqldf("select distinct AGEP from acs")
unique(acs$AGEP)

##question4
con=url("http://biostat.jhsph.edu/~jleek/contact.html")
htmlcode = readLines(con)
close(con)
htmlcode
nchar(htmlcode[10])
nchar(htmlcode[20])
nchar(htmlcode[30])
nchar(htmlcode[100])

##Question 5 
con=url("https://d396qusza40orc.cloudfront.net/getdata%2Fwksst8110.for")
htmlcode = readLines(con)
close(con)
write.table(htmlcode, file="htmlcode.txt", sep = "")##open file with notepad and check the data structure
data<-read.fwf("htmlcode.txt", skip=4, widths = c(12, 7, 4, 9,4,9,4,9,4))

data <- read.fwf(file = "https://d396qusza40orc.cloudfront.net/getdata%2Fwksst8110.for",
                 skip = 4,
                 widths = c(12, 7,4, 9,4, 9,4, 9,4))
sum(data[,4])
