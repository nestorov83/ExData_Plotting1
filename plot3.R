library(sqldf)
 


download.file(url="https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", destfile="download.zip", method="curl")
unzip("download.zip")
data.sub <- read.csv.sql("household_power_consumption.txt", header=TRUE, sep=";", sql="Select * from file where Date = '1/2/2007' OR Date = '2/2/2007'")
data.sub[,7] <- as.numeric(data.sub[,7])
data.sub[,8] <- as.numeric(data.sub[,8])
data.sub[,9] <- as.numeric(data.sub[,9])
 
png("plot3.png")
plot(data.sub[,7], type="n", xaxt="n", ylab="Energy sub metering", xlab="")
lines(data.sub[,7], type="l")
lines(data.sub[,8], type="l", col="red")
lines(data.sub[,9], type="l", col="blue")
axis(1, at= c(1,1440,2880), labels=c("Thu", "Fri", "Sat"))
legend("topright", lty=c(1), col = c("black", "blue", "red"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.off()

