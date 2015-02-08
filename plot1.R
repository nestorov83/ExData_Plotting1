#load package dplyr
library(dplyr)


#download, open and subset data
download.file(url="https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", destfile="download.zip", method="curl")
unzip("download.zip")
data <- read.csv("household_power_consumption.txt", header=TRUE, sep=";",  stringsAsFactor = FALSE)
sel <- c("1/2/2007", "2/2/2007")
data.sub <- filter(data, Date %in% sel)

#convert to numeric
data.sub[,3] <- as.numeric(data.sub[,3])

#plot histogram
png("plot1.png")
hist(data.sub[,3], col = "red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.off()