##Import data from txt file
file <- "household_power_consumption.txt"
data <- read.table(file, header = TRUE, sep = ";", dec = ".", na.strings = "?")

##Subset data from the dates 2007-02-01 and 2007-02-02
dataset <- data[data$Date %in% c("1/2/2007","2/2/2007"), ]

##Plot the data into 4 graphs and save it to a PNG file with a width of 480 pixels and a height of 480 pixels
png("plot4.png", width=480, height=480)
par(mfrow = c(2,2))
plot(time_axis, dataset[, 3], xlab = "", ylab = "Global Active Power (kilowatts)", type = "l")
plot(time_axis, dataset[, 5], xlab = "datetime", ylab = "Voltage", type = "l")
plot(time_axis, dataset[, 7], xlab = "", ylab = "Energy sub metering", type = "l")
lines(time_axis, dataset[, 8], col = "red")
lines(time_axis, dataset[, 9], col = "blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       col = c("black","red","blue"), cex = 0.8, lty = 1 , bty = "n")
plot(time_axis, dataset[, 4], xlab = "datetime", ylab = "Global_reactive_power", type = "l")
dev.off()