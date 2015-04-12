# Load data
data <- read.csv("../Data/household_power_consumption.txt", sep = ";")
# Select entries for 1st and 2nd of Feb
data <- data[data$Date == "1/2/2007" | data$Date == "2/2/2007", ]
# Extract xs
datetime <- paste(data$Date, data$Time)
hours <- strptime(datetime, "%d/%m/%Y %H:%M:%S")
# Extract ys
es1 <- as.numeric(levels(data$Sub_metering_1)[data$Sub_metering_1])
es2 <- as.numeric(levels(data$Sub_metering_2)[data$Sub_metering_2])
es3 <- as.numeric(data$Sub_metering_3)
# Open png
png(filename="plot3.png")
# Plot
plot(xs, es1, type="l",xlab="", ylab="Energy sub metering")
lines(xs, es2, col="red")
lines(xs, es3, col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col = c("black", "red", "blue"), lty=c(1,1))
# Write and close
dev.off()