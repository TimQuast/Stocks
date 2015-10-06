quote <- function(ids="GOOG", properties=c("n","l1")){
	url <-"http://download.finance.yahoo.com/d/quotes.csv?s="
	id <- paste(ids,collapse=",")
	prop <- paste(c("&f=",properties),collapse="")
	url = paste(url,id,prop,"&e=.csv",sep="")
	read.csv(url,FALSE)

}
