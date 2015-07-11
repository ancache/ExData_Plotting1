##############################################################################
## Anca Chereches, 07/10/2015
## Coursera course: "Exploratory Data Analysis"
## Week 1 -- Project 1
##############################################################################

dataTMP <- read.table("household_power_consumption.txt", header=TRUE, sep = ";", na.strings="?")
# the entire dataset is too large
# select lines of interest and remove rest from memory
data <- dataTMP[dataTMP$Date == "1/2/2007" | dataTMP$Date == "2/2/2007",]
rm(dataTMP)

strDates = paste(data$Date, data$Time)
data$RDates = strptime(strDates,"%d/%m/%Y %H:%M:%S")

## Start plotting

par(mar=c(7,5,4,2))
par(mfrow = c(2,2))

with(data, { 
	# Plot 1
	plot(data$RDates, data$Global_active_power, type="l", ylab = "Global Active Power", xlab="")
	
	# Plot 2
	plot(data$RDates, data$Voltage, type="l", ylab = "Voltage", xlab="datetime")
	
	# Plot 3
	plot(RDates, Sub_metering_1, xlab="", ylab = "Energy sub metering", type="l")
points(RDates, Sub_metering_2, type="l", col="red")
points(RDates, Sub_metering_3, type="l", col="blue")
legend("topright", lty = 1,col = c("black","red","blue"), legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

	# Plot 4
	plot(data$RDates, data$Global_reactive_power, type="l", ylab = "Global_reactive_power", xlab="datetime")
})

dev.copy(png, file="plot4.png",width = 480,height=480)
dev.off()