# Load data
data <- read.csv("../Data/household_power_consumption.txt", sep = ";")
# Select entries for 1st and 2nd of Feb
data <- data[data$Date == "1/2/2007" | data$Date == "2/2/2007", ]
# Extract xs
datetime <- strptime(paste(data$Date, data$Time), "%d/%m/%Y %H:%M:%S")
# Extract ys
global_active_power <- as.numeric(levels(data$Global_active_power)[data$Global_active_power])
# Open png
png(filename="plot2.png")
# Plot (day names are different due to locale settings (Polish))
plot(datetime, global_active_power, xlab="", ylab="Global Active Power (kilowatts)", type="l")
# Write and close
dev.off()