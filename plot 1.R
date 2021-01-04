data <- read.table("data/household_power_consumption.txt", 
                   sep = ";", 
                   header = TRUE,
                   na.strings = "?",
                   nrows = 2075259,
                   comment.char="")
data$Date <- as.Date(data$Date, "%d/%m/%Y")
data <- data[(data$Date == "2007-02-01") | (data$Date == "2007-02-02"),]

png("plot1.png", width = 480, height = 480)

hist(data$Global_active_power,
     col = "red",
     xlab = "Global Active Power (kilowatts)",
     main = "Global Active Power")

dev.off()
