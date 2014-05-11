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

png(filename = "plot3.png", width = 480, height = 480, units = "px")

plot(x = indata$Date, y = indata$Sub_metering_1, ylab = "Energy sub metering", xlab = "", type = "l")
lines(x = indata$Date, y = indata$Sub_metering_2, col = "red")
lines(x = indata$Date, y = indata$Sub_metering_3, col = "blue")
legend("topright", lwd =1, col = c("black", "red","blue"), legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

dev.off()
