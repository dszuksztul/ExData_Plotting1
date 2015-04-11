source("read_data.R")

data_datetime <-readAssignment1Data()

png(filename = "plot4.png")
par(mfrow = c(2, 2))

plot(data_datetime$Date_Time, data_datetime$Global_active_power, type="l", ylab = "Global Active Power (killowats)", xlab = "")

plot(data_datetime$Date_Time, data_datetime$Voltage, type="l", ylab = "Voltage", xlab = "datetime")

plot(data_datetime$Date_Time, data_datetime$Sub_metering_1, ylab = "Energy sub metering", xlab = "", type="n")
lines(data_datetime$Date_Time, data_datetime$Sub_metering_1, col="black")
lines(data_datetime$Date_Time, data_datetime$Sub_metering_2, col="red")
lines(data_datetime$Date_Time, data_datetime$Sub_metering_3, col="blue")
legend("topright", col=c("black", "red", "blue"), legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=c(1,1), bty = "n")

plot(data_datetime$Date_Time, data_datetime$Global_reactive_power, type="l", xlab = "datetime", ylab = "Global_reactive_power")

dev.off()