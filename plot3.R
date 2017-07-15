#load
data <- "./household_power_consumption.txt"
energy <- read.table(data, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")

#parse
readyData <- energy[energy$Date %in% c("1/2/2007","2/2/2007") ,]

#date & convert
dateTime <- strptime(paste(readyData$Date, readyData$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
globalPower <- as.numeric(readyData$Global_active_power)

#Sub Metering Lines
sub1 <- as.numeric(readyData$Sub_metering_1)
sub2 <- as.numeric(readyData$Sub_metering_2)
sub3 <- as.numeric(readyData$Sub_metering_3)

#plot
plot(dateTime, sub1, type="l", ylab="Energy Submetering", xlab="")
lines(dateTime, sub2, type="l", col="red")
lines(dateTime, sub3, type="l", col="blue")

#legend
legend("topright", lty = 1, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

#print 
dev.copy(png, file= "plot3.png", width=480, height=480)
dev.off()