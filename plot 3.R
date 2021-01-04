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

png("plot3.png", width = 480, height = 480)

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
       lwd=c(1,1))


dev.off()
