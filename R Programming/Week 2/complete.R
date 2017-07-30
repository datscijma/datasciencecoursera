setwd("/Users/jarratt/Documents/R/R Programming/Week 2")

list.files()

complete <- function(directory, id = 1:332) {
	lf <- list.files(directory, full.names=TRUE)
	dat <- data.frame()
	dat_summ <- data.frame()
	for (i in id) {
		dat <- read.csv(lf[i])
		nobs <- sum(complete.cases(dat))
		dat_summ <- rbind(dat_summ, c(i, nobs))
	}
	colnames(dat_summ) <- c("id","nobs")
	dat_summ
}

complete("specdata", 1)
complete("specdata", c(2, 4, 8, 10, 12))
complete("specdata", 30:25)
complete("specdata", 3)