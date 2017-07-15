 
#load
data <- "./household_power_consumption.txt"
energy <- read.table(data, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")

#parse and convert
readyData <- energy[energy$Date %in% c("1/2/2007","2/2/2007") ,]
globalPower <- as.numeric(readyData$Global_active_power)

#plot
hist(globalPower, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")

#print 
dev.copy(png, file= "plot1.png", width=480, height=480)
dev.off()