##Import data from txt file
file <- "household_power_consumption.txt"
data <- read.table(file, header = TRUE, sep = ";", dec = ".", na.strings = "?")

##Subset data from the dates 2007-02-01 and 2007-02-02
dataset <- data[data$Date %in% c("1/2/2007","2/2/2007"), ]

##Set language
Sys.setlocale("LC_TIME", "English")

##Format the time vector
date_converted <- as.Date(dataset[, 1], format = "%d/%m/%Y")
time_converted <- strptime(dataset[, 2], format = "%H:%M:%S")
time_axis <- as.POSIXct(paste(date_converted, dataset[, 2]))

##Plot the global active power against time vector and save it to a PNG file with a width of 480 pixels and a height of 480 pixels
png("plot2.png", width=480, height=480)
plot(time_axis, dataset[, 3], xlab = "", ylab = "Global Active Power (kilowatts)", type = "l")
dev.off()