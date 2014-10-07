# load the data household_power_consumption.txt from the working directory
complete_data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")

#change the format of the date for the entire data
complete_data$Date <- as.Date(complete_data$Date, format = "%d/%m/%Y")

#make a subset of data for dates 2007-02-01 and 07-02-02
new_data <- subset(complete_data, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))

#convert data and time
date_time <- paste(as.Date(new_data$Date), new_data$Time)
new_data$Time_of_the_Date <- as.POSIXct(date_time)

##Creating Plot 4
par(mfrow=c(2,2))
with(new_data, {
  plot(Global_active_power ~ Time_of_the_Date, type = "l", 
       ylab = "Global Active Power", xlab = "")
  plot(Voltage ~ Time_of_the_Date, type = "l", 
       ylab= "Voltage", xlab = "datetime")
  plot(Sub_metering_1 ~ Time_of_the_Date, type = "l", 
       ylab="Energy sub metering", xlab="")
  lines(Sub_metering_2 ~ Time_of_the_Date, col="Red")
  lines(Sub_metering_3 ~ Time_of_the_Date, col="Blue")
  legend("topright", col=c("black", "red", "blue"), lty = 1, lwd = 2,
      legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
  plot(Global_reactive_power ~ Time_of_the_Date, type = "l", 
       ylab = "Global_rective_power", xlab = "datetime")
})


#Saving on a PNG file in the working directory
dev.copy(png, file = "plot4.png", height = 480, width = 480)
dev.off()
