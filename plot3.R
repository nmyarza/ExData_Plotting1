##Import data from txt file
file <- "household_power_consumption.txt"
data <- read.table(file, header = TRUE, sep = ";", dec = ".", na.strings = "?")

##Subset data from the dates 2007-02-01 and 2007-02-02
dataset <- data[data$Date %in% c("1/2/2007","2/2/2007"), ]

##Plot the data
png("plot3.png", width=480, height=480)
plot(time_axis, dataset[, 7], xlab = "", ylab = "Energy sub metering", type = "l")
lines(time_axis, dataset[, 8], col = "red")
lines(time_axis, dataset[, 9], col = "blue")

legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       col = c("black","red","blue"), lty = 1)

dev.off()