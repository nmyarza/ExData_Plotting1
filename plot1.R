##Import data from txt file
file <- "household_power_consumption.txt"
dataset <- read.table(file, header = TRUE, sep = ";", dec = ".", na.strings = "?")

##Subset data from the dates 2007-02-01 and 2007-02-02
dataset <- data[data$Date %in% c("1/2/2007","2/2/2007"), ]

##Plot the histogram plot and save it to a PNG file with a width of 480 pixels and a height of 480 pixels
png("plot1.png", width=480, height=480)
hist(data[, 3], col = "red", main = "Global Active Power", 
     xlab = "Global Active Power (kilowatts)")
dev.off()