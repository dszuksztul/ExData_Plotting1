source("read_data.R")

data_datetime <-readAssignment1Data()

png(filename = "plot1.png")
hist(data_datetime$Global_active_power, main = "Global Active Power", col = "red", xlab = "Global Active Power (killowats)")
dev.off()
