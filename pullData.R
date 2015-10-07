quote <- function(ids="GOOG", properties=c("n","l1")){
	url <-"http://download.finance.yahoo.com/d/quotes.csv?s="
	id <- paste(ids,collapse=",")
	prop <- paste(c("&f=",properties),collapse="")
	url = paste(url,id,prop,"&e=.csv",sep="")
	x <-read.csv(url,FALSE,col.names=properties)
	x$time <- Sys.time()
	x

}

pull <- function(n=100,...){
	x <- data.frame()
	print(Sys.time())
	for(i in 1:n){
		x = rbind(x,quote(...))
	}
	print(Sys.time())
	x
}

stripTime <- function(time){
	x <- as.character(time)
	x = as.character(x)
	x = strsplit(x," ")
	x = x[[1]][2]
	x = strsplit(x,":")
	x = as.numeric(x[[1]])
	x
}
