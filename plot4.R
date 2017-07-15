#load
data <- "./household_power_consumption.txt"
energy <- read.table(data, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")

#parse
readyData <- energy[energy$Date %in% c("1/2/2007","2/2/2007") ,]

#date & convert
dateTime <- strptime(paste(readyData$Date, readyData$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
#active
globalPower <- as.numeric(readyData$Global_active_power)
#reactive
globalReactive <- as.numeric(readyData$Global_reactive_power)
#voltage
voltage <- as.numeric(readyData$Voltage)
#sub metering Lines
sub1 <- as.numeric(readyData$Sub_metering_1)
sub2 <- as.numeric(readyData$Sub_metering_2)
sub3 <- as.numeric(readyData$Sub_metering_3)

#plot 
par(mfrow = c(2, 2)) 
#top left
plot(dateTime, globalPower, type="l", xlab="", ylab="Global Active Power")
#top right
plot(dateTime, voltage, type="l", xlab="datetime", ylab="Voltage")

#bottom left
plot(dateTime, sub1,type = "1", ylab="Energy Submetering", xlab="")
lines(dateTime, sub2, col="red")
lines(dateTime, sub3, col="blue")
#legend
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=, col=c("black", "red", "blue"), bty="o")

#bottom right
plot(dateTime, globalReactive, type="l", xlab="datetime", ylab="Global_reactive_power")



#print 
dev.copy(png, file= "plot4.png", width=480, height=480)
dev.off()