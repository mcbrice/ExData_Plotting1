# Read data from file
data <- read.csv2("household_power_consumption.txt", na.strings = "?", header = TRUE)
data2 <- subset(data, Date == "1/2/2007" | Date == "2/2/2007")

# Open png
png("plot1.png", width = 480, height = 480)

# Plot
hist(as.numeric(data2$Global_active_power), xlab = "Global Active Power (kilowatts)", main = "Global Active Power", col = "red")

# Close png
dev.off()