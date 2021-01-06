# Read data from file
data <- read.csv2("household_power_consumption.txt", na.strings = "?", header = TRUE)
data2 <- subset(data, Date == "1/2/2007" | Date == "2/2/2007")

# Combine date and time columns, then convert to Date objects
x <- paste(data2$Date, data2$Time)
dates <- strptime(x, "%d/%m/%Y %H:%M:%S")

# Open png
png("plot4.png", width = 480, height = 480)

# 2 rows, 2 cols
par(mfrow = c(2, 2))

# Plot top left
plot(dates, data2$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power")

# Plot top right
plot(dates, data2$Voltage, type = "l",  xlab = "datetime", ylab = "Voltage")

# Plot bottom left
plot(dates, data2$Sub_metering_1, type = "n", xlab = "", ylab = "Energy sub metering")
lines(dates, data2$Sub_metering_1)
lines(dates, data2$Sub_metering_2, col = "red")
lines(dates, data2$Sub_metering_3, col = "blue")
legend("topright",
       lty = c(1, 1, 1),
       lwd = c(1, 1, 1),
       bty = "n",
       col = c("black", "blue", "red"),
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

# Plot bottom right
plot(dates, data2$Global_reactive_power, type = "l", lwd = 2, xlab = "datetime", ylab = "Global_reactive_power")

# Close png
dev.off()