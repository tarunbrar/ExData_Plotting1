# load the data household_power_consumption.txt from the working directory
complete_data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")

#change the format of the date for the complete_data dataset
complete_data$Date <- as.Date(complete_data$Date, format = "%d/%m/%Y")

#make a subset of data for dates 2007-02-01 and 2007-02-02
new_data <- subset(complete_data, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))

#convert date and time and put it in a new variable datetime
date_time <- paste(as.Date(new_data$Date), new_data$Time)
new_data$datetime <- as.POSIXct(date_time)

##Creating Plot 2
plot(new_data$Global_active_power ~ new_data$datetime, 
     type = "l", ylab = "Global Active Power (kilowatts)", xlab ="")

#Saving on a PNG file in the working directory
dev.copy(png, file = "plot2.png", height = 480, width = 480)
dev.off()

