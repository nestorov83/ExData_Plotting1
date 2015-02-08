#open sqldf package
library(sqldf)



download.file(url="https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", destfile="download.zip", method="curl")
unzip("download.zip")
data.sub <- read.csv.sql("household_power_consumption.txt", header=TRUE, sep=";", sql="Select * from file where Date = '1/2/2007' OR Date = '2/2/2007'")

data.sub[,3] <- as.numeric(data.sub[,3])

png("plot2.png")
plot(data.sub[,3], type="n", xaxt="n", ylab="Global Active Power (kilowatts)", xlab="")
lines(data.sub[,3], type="l")
axis(1, at= c(1,1440,2880), labels=c("Thu", "Fri", "Sat"))
dev.off()
