source("read_data.R")

data_datetime <-readAssignment1Data()

png(filename = "plot3.png")
plot(data_datetime$Date_Time, data_datetime$Sub_metering_1, ylab = "Energy sub metering", xlab = "", type="n")
lines(data_datetime$Date_Time, data_datetime$Sub_metering_1, col="black")
lines(data_datetime$Date_Time, data_datetime$Sub_metering_2, col="red")
lines(data_datetime$Date_Time, data_datetime$Sub_metering_3, col="blue")
legend("topright", col=c("black", "red", "blue"), legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=c(1,1))
dev.off()