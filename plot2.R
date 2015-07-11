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

plot(data$RDates, data$Global_active_power, type="l", ylab = "Global Active Power (kilowatts)", xlab="")
dev.copy(png, file="plot2.png",width = 480,height=480)
dev.off()