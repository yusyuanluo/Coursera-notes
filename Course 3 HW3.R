download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv", "idaho.csv", method = "curl")
data<-read.csv("idaho.csv")
library(dplyr)
data<-mutate(data, agricultureLogical=as.logical(ACR==3 & AGS==6))
agricultureLogical<-data$ACR==3&data$AGS==6
which(agricultureLogical)

##Q2
library(jpeg)
download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fjeff.jpg", "Q2.jpg", mode="wb")
Q2<-readJPEG("Q2.jpg", native = TRUE)
quantile(Q2, prob=c(0.3,0.8))

##Q3
library(data.table)
download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FGDP.csv", "product.csv", method="curl")
download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FEDSTATS_Country.csv", "ed.csv", method="curl")
prod <- fread("product.csv", skip = 5, nrows = 190, select = c(1, 2, 4, 5), col.names = c("CountryCode", "Rank", "Economy", "Total"))
ed<-read.csv("ed.csv")
merge<-merge(ed, prod, by='CountryCode')
Q3_Merge <- merge %>% arrange(desc(Rank))
Q3_Merge[13,"Long.Name"]

##Q4
OECD<- filter(Q3_Merge, Income.Group=="High income: OECD")
mean(OECD$Rank)


##Q5
quantile(Q3_Merge$Total, probs=seq(0,1,0.2))
rich<-filter(Q3_Merge, Rank<39)%>%filter(Income.Group=='Lower middle income')
