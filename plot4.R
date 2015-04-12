# Load data
data <- read.csv("../Data/household_power_consumption.txt", sep = ";")
# Select entries for 1st and 2nd of Feb
data <- data[data$Date == "1/2/2007" | data$Date == "2/2/2007", ]

## GLOBAL PLOT SETTING ##
# Open png
png(filename="plot4.png")
# Set the layout
par(mfrow=c(2,2))

## ALL PLOTS ##
# Extract xs
datetime <- strptime(paste(data$Date, data$Time), "%d/%m/%Y %H:%M:%S")


## PLOT 1 ##
# Extract ys
global_active_power <- as.numeric(levels(data$Global_active_power)[data$Global_active_power])
# Plot (day names are different due to locale settings (Polish))
plot(datetime, global_active_power, xlab="", ylab="Global Active Power", type="l")

## PLOT 2 ##
# Extract ys
voltage <- as.numeric(levels(data$Voltage)[data$Voltage])
# Plot
plot(datetime, voltage, ylab="Voltage", type="l")

## PLOT 3 ##
# Extract ys
es1 <- as.numeric(levels(data$Sub_metering_1)[data$Sub_metering_1])
es2 <- as.numeric(levels(data$Sub_metering_2)[data$Sub_metering_2])
es3 <- as.numeric(data$Sub_metering_3)
# Plot
plot(xs, es1, type="l",xlab="", ylab="Energy sub metering")
lines(xs, es2, col="red")
lines(xs, es3, col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col = c("black", "red", "blue"), lty = c(1,1), bty = "n")


## PLOT 4 ##
# Extract ys
Global_reactive_power <- as.numeric(levels(data$Global_reactive_power)[data$Global_reactive_power])
# Plot
plot(datetime, Global_reactive_power, type="l", cex.axis=0.75)
# Write and close
dev.off()