source("read_data.R")

data_datetime <-readAssignment1Data()

png(filename = "plot2.png")
plot(data_datetime$Date_Time, data_datetime$Global_active_power, type="l", ylab = "Global Active Power (killowats)", xlab = "")
dev.off()