##Reading data from the web
con=url("https://scholar.google.com/citations?hl=en&user=pBp4RMoAAAAJ")
htmlcode = readLines(con)
close(con)
htmlcode

install.packages("XML")
library(XML)
url<-" "
html<-htmlTreeParse(url, useInternalNodes=T)
xpathSApply(html, "//title", xmlvalue)

##Get from httr package 
library(httr);
html2=get(url)
content2=content(html2, as='text')
parsedHtml=htmlParse(content2, asText=TRUE)
xpathSApply(parsedHtml, "//title", xmlValue)

##accessing websites with passwords
pg1 = GET("http://httpbin.org/basic-auth/user/passwd")
pg2 = GET("http://httpbin.org/basic-auth/user/passwd", 
          authenticate("user","passwd"))

##using handles 
google = handle("http://google.com")
pg1=GET(handle=google, path="/")
pg2=GET(handle=google, path="search")

