setwd("/Users/jarratt/Documents/R/R Programming/Week 2")

list.files()

corr2 <- function(directory, threshold=0) {
	lf <- list.files(directory, full.names=TRUE)
	dat <- data.frame()
	dat_c <- data.frame()
	dat_corr <- c()

	obs <- complete(directory)	## load complete.R first
	if (threshold == 0){
		cobs <- obs[which(obs[,"nobs"] >0),]
	} 
	if (threshold > 0){
		cobs <- obs[which(obs[,"nobs"] >=threshold),]
	} 
	id <- cobs[, "id"]

	for (i in id) {
		dat <- read.csv(lf[i])
		dat_c <- cor(dat[,2], dat[,3], use="pairwise.complete.obs")
		dat_corr <- c(dat_corr, dat_c)
	}
	dat_corr
}

obs <- complete("specdata")
cobs <- obs[which(obs[,"nobs"] >0),]

cr <- corr2("specdata", 150)
head(cr)
summary(cr)

cr <- corr2("specdata", 400)
head(cr)
summary(cr)

cr <- corr2("specdata", 5000)
summary(cr)
length(cr)

cr <- corr2("specdata")
summary(cr)
length(cr)

corr <- function(directory, threshold=0) {
	lf <- list.files(directory, full.names=TRUE)
	dat <- data.frame()
	dat_c <- data.frame()
	dat_corr <- c()
	for (i in 1:332) {
		dat <- read.csv(lf[i])
		nobs <- sum(complete.cases(dat))
		if (nobs>=threshold){
			dat_c <- cor(dat[,2], dat[,3], use="pairwise.complete.obs")
			dat_corr <- c(dat_corr, dat_c)
		}
	}
	dat_corr
}

cr <- corr("specdata", 150)
head(cr)
summary(cr)

cr <- corr("specdata", 400)
head(cr)
summary(cr)

cr <- corr("specdata", 5000)
summary(cr)
length(cr)

cr <- corr("specdata")
summary(cr)
length(cr)