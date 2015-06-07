# 
# Read power consumption data into data frame, converting the date and time fields
# into character fields. It is assumed that the input is located in the same directory
# as this script.
#
#power_dat <- read.csv("~/ExData_Plotting1/household_power_consumption.txt", sep=";", 
#                      stringsAsFactors = FALSE, na.strings = c("?"),
#                      colClasses = c("character", "character", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric")
#)
power_dat <- power_dat1

#
# Filter data frame down to just data for the dates 2007-02-01 and 2007-02-02
#
power_dat <- power_dat[power_dat$Date == "1/2/2007" | power_dat$Date == "2/2/2007",]


#
# Add a "Date.Time" comlumn for the combines the date and time columns
#
Date.Time <- strptime(paste(power_dat$Date, power_dat$Time), format = "%d/%m/%Y %H:%M:%S")
power_dat <- cbind(Date.Time, power_dat)

#
# Draw plot3 - A line chart with a seperate plot for each sub-metering type
#
with(power_dat, plot(power_dat$Date.Time, power_dat$Sub_metering_1, type = "l", xlab ="", ylab = "Energy sub metering"))
legend("topright", pch = "_", col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
#plot(power_dat$Date.Time, power_dat$Global_active_power, type = "l", 
 #    xlab ="", ylab = "Global Acitve Power (kilowatts)")


#
# Save chart to png
#
dev.copy(png, filename = "plot3.png")
dev.off()