#getting and cleaning data week 4
## change the capitalized letters to lowercase letters
tolower(names(datamatrix))
### change the lowercase letters to the capitalized letters 
toupper()
##split variable names (location.1=>> "location", "1")
splitNames= strsplit(names(data), "\\.")
splitNames[[5]]
##Remove periods from names in data frames 
firstElement<-function(x){x[1]}
sapply(splitNames, firstElement)

##remove the underscores in the column names (only remove the first underscore it detects)
names(reviews)
sub("_","", names(reviews),)
##remove every underscores it detects 
gsub("_","",testName)
##finding values-grep(),grepl()
grep("Alameda", cameradata$intersection)
table(grepl("Alameda", cameradata$intersection))
cameraData2<-cameradata[!grepl("Alameda",cameraData$intersection),]
##return the value where we can find the string
grep("Alameda", cameradata$intersection, value=TRUE)

#library(stringr)# of characters 
nchar("Jeffrey Leek")

##paste characters with space 
paste()
##paste character without space
paste0()

##stringr package :str_trim remove excess space
str_strim("Jeff     ")


##regular expressions 
^i think ##will match the lines starting with "i think"
$ represent the end of the line
morning$ ## will match the lines ending with morning 
[Bb][Uu][Ss][Hh] ##will match the lines with any kinds of combination "BUSH"
[^?.]$  ## will match the lines without ? or . as the ending 
"." is used to refer to any character
or "|"  


###formatting dates
format(d2, "%a %b %d")
%d= day as number; %a=abbreviated weekday, %A= unabbreviated weekdays, %m=month (00-12), %b=abbreviated month, %B=unabbreviated month, 
%y=2 digit year; %Y= four digit year

##creating dates 
x=c("1jan1960","2jan1960", "31mar1960","30jul1960"); z=as.Date(x, "%d%b%Y")
z
z[1]-z[2]
as.numeric(z[1]-z[2])