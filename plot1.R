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

## Start plotting

# must set margins to allow x-axis label to show
par(mar=c(7,5,4,2))
hist(data$Global_active_power,col="red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)",ylab)

dev.copy(png, file="plot1.png",width = 480,height=480)
dev.off()