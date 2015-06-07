# 
# Read power consumption data into data frame, converting the date and time fields
# into their corrsponding classes
#
maxLines = 1000
power_dat0 <- read.csv("~/ExData_Plotting1/household_power_consumption.txt", sep=";", 
                        stringsAsFactors = FALSE, na.strings = c("?"),
                        colClasses = c("character", "character", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric")
#                        ,nrows = maxLines
                        )

#
# Filter data frame down to just data for the dates 2007-02-01 and 2007-02-02
#
power_dat <- power_dat0[power_dat0$Date == "1/2/2007" | power_dat0$Date == "2/2/2007",]
#power_dat <- power_dat[power_dat$Date == "16/12/2006" || power_dat$Date == "1/2/2007" || power_dat$Date == "2/2/2007",]




#
# Draw histogram
#
hist(power_dat$Global_active_power, main = "Gobal Active Power", col = "red", 
        xlab = "Global Acitve Power (kilowatts)")

#
# Save histogram to png
#
dev.copy(png, filename = "plot1.png")
dev.off()