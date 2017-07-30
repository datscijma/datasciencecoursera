setwd("/Users/jarratt/Documents/R/R Programming/Week 2")

list.files()

pollutantmean <- function(directory, pollutant, id = 1:332) {
	lf <- list.files(directory, full.names=TRUE)
	dat <- data.frame()
	for (i in id) {
		dat <- rbind(dat, read.csv(lf[i]))
	}
	mean(dat[,pollutant], na.rm=TRUE)
}

pollutantmean("specdata", "sulfate", 1:10)	## [1] 4.064128
pollutantmean("specdata", "nitrate", 70:72)	## [1] 1.706047
pollutantmean("specdata", "nitrate", 23)		## [1] 1.280833