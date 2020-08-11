##reading mySQL
##install RmySQL
##http://biostat.mc.vanderbilt.edu/wiki/Main/RMySQL

##connecting and listing databases
UCSCDb <- dbConnect(MYSQL(), user="genome", 
                    host="genome-mysql.cse.ucsc.edu")
result<-dbGetQuery(UCSCDb,"show databases;"); dbDisconnect(UCSCDb);

##connecting to hg19 and listing tables
hg19<-dbConnect(MySQL(),user="genome", db="hg19",
                host="genome-mysql.cse.ucsc.edu")
allTables<-dbListTables(hg19)

##get dimensions of a specific table 
dbListFields(hg19, "affyU133Plus2")
dbGetQuery(hg19, "select count(*) from affyU133Plus2")

##Read from the table
affydata<-dbReadTable(hg19, "affyU133Plus2")
head(affydata)

##select a specific subset
query<- dbSendQuery(hg19, "select * from affyU133Plus2 where misMatches between 1 and 3")
affyMis<-fetch(query); quantile(affyMis$misMatches)

affyMisSmall<-fetch(query,n=10); dbClearResult(query);