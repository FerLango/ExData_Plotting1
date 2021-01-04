data <- read.table("data/household_power_consumption.txt", 
                   sep = ";", 
                   header = TRUE,
                   na.strings = "?",
                   nrows = 2075259,
                   comment.char="")
data$DateTime <- as.POSIXct(paste(data$Date, data$Time), 
                            format = "%d/%m/%Y %H:%M:%S")
data <- data[(data$DateTime >= "2007-02-01") & 
                 (data$DateTime <= "2007-02-03"),]

png("plot4.png", width = 480, height = 480)

par(mfcol=c(2,2))

#1
plot(x = data$DateTime,
     y = data$Global_active_power,
     type = "l",
     ylab = "Global Active Power",
     xlab = "")

#2
plot(x = data$DateTime,
     y = data$Sub_metering_1,
     type = "l",
     ylab = "Energy sub metering",
     xlab = "")
lines(x = data$DateTime,
      y = data$Sub_metering_2,
      col = "red")
lines(x = data$DateTime,
      y = data$Sub_metering_3,
      col = "blue")
legend(x = "topright",
       col = c("black","red","blue"),
       legend = c("Sub_metering_1","Sub_metering_2", "Sub_metering_3"),
       lwd=c(1,1),
       bty = "n")

#3
plot(x = data$DateTime,
     y = data$Voltage,
     type = "l",
     ylab = "Voltage",
     xlab = "datetime")

#4
plot(x = data$DateTime,
     y = data$Global_reactive_power,
     type = "l",
     xlab = "datetime",
     ylab = "Global_reactive_power")

dev.off()
