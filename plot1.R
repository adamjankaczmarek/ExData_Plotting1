# Load data
data <- read.csv("../Data/household_power_consumption.txt", sep = ";")
# Select entries for 1st and 2nd of Feb
data <- data[data$Date == "1/2/2007" | data$Date == "2/2/2007", ]
# Extract and convert
global_active_power <- as.numeric(levels(data$Global_active_power)[data$Global_active_power])
# Open png
png(filename="plot1.png")
# Create plot
hist(global_active_power, col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")
# Write and close
dev.off()