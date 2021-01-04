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

png("plot2.png", width = 480, height = 480)

plot(x = data$DateTime,
     y = data$Global_active_power,
     type = "l",
     ylab = "Global Active Power (kilowatts)",
     xlab = "")

dev.off()
