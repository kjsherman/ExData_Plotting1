
#load
data <- "./household_power_consumption.txt"
energy <- read.table(data, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")

#parse
readyData <- energy[energy$Date %in% c("1/2/2007","2/2/2007") ,]

#date & convert
dateTime <- strptime(paste(readyData$Date, readyData$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
globalPower <- as.numeric(readyData$Global_active_power)

#plot
plot(dateTime, globalPower, type="l", xlab="", ylab="Global Active Power (kilowatts)")

#print 
dev.copy(png, file= "plot2.png", width=480, height=480)
dev.off()
