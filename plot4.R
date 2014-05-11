setwd("C:/Users/andy29075/Dropbox/Self-study/Coursera & MOOCs/DS4 - Exploratory Data Analysis/Project1")

indata <- read.csv("household_power_consumption.txt", 
                   col.names = colnames(read.table("household_power_consumption.txt", nrow = 1,   header = TRUE, sep=";")),
                   sep=";", 
                   na.strings = "?", 
                   comment.char = "", 
                   colClasses = c("character", "character", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric"),
                   skip = 66636,
                   nrows = 2880,
                   header=TRUE)

indata$Date <- strptime(paste(indata$Date, indata$Time, sep=" "), format="%d/%m/%Y %H:%M:%S")

png(filename = "plot4.png", width = 480, height = 480, units = "px")
par(mfrow=c(2,2))

## plot 1
plot(x = indata$Date, y = indata$Global_active_power, ylab = "Global Active Power", xlab = "", type = "l")

## plot 2
plot(x = indata$Date, y = indata$Voltage, ylab = "Voltage", xlab = "datetime", type = "l")

## plot 3
plot(x = indata$Date, y = indata$Sub_metering_1, ylab = "Energy sub metering", xlab = "", type = "l")
lines(x = indata$Date, y = indata$Sub_metering_2, col = "red")
lines(x = indata$Date, y = indata$Sub_metering_3, col = "blue")
legend("topright", lwd =1, border=NULL, col = c("black", "red","blue"), legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),  bty = "n" )

## plot 4
plot(x = indata$Date, y = indata$Global_reactive_power, ylab = "Global_reactive_power", xlab = "datetime", type = "l")

dev.off()
