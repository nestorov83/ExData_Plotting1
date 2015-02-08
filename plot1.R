#load package
library(sqldf)


##download and unzip data
download.file(url="https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", destfile="download.zip", method="curl")
unzip("download.zip")

##import only the necessary part of the huge dataset
data.sub <- read.csv.sql("household_power_consumption.txt", header=TRUE, sep=";", sql="Select * from file where Date = '1/2/2007' OR Date = '2/2/2007'")
data.sub[,3] <- as.numeric(data.sub[,3])

#plot histogram
png("plot1.png")
hist(data.sub[,3], col = "red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.off()