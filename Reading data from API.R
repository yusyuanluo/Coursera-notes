##Reading data from API
##httr package 
install.packages("httr")
library(httr)
myapp= oauth_app("twitter", 
                 key="yourConcumerKeyHere", secret="yourConsumerSecretHere")

sig = sign_oauth1.0(myapp,
                    token = "yourTokenHere",
                     token_secret = "yourTokenSecretHere")

homeTL = GET ("https://api.twitter.com/1.1/statuses/home_timeline.json", sig)

Json1 =content(homeTL)
json2 = jsonlite::fromJSON(toJSON(Json1))
Json2[1,1:4]