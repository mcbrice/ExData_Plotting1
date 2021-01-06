# Read data from file
data <- read.csv2("household_power_consumption.txt", na.strings = "?", header = TRUE)
data2 <- subset(data, Date == "1/2/2007" | Date == "2/2/2007")

# Combine date and time columns, then convert to Date objects
x <- paste(data2$Date, data2$Time)
dates <- strptime(x, "%d/%m/%Y %H:%M:%S")

# Open png
png("plot2.png", width = 480, height = 480)

# Plot
plot(dates, data2$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")

# Close png
dev.off()