## Read dates 01-02-2007 through 01-02-2007 data from original dataset
data <- read.table(
        "C:/Users/Mike/Desktop/Coursera/data/household_power_consumption.txt",sep = ";", 
        colClasses = c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric"), 
        skip = 66637,  nrow = 2880,
        col.names = colnames(read.table("C:/Users/Mike/Desktop/Coursera/data/household_power_consumption.txt",
                                        nrow = 1, sep = ";", header = TRUE)))

## Convert Date col to date format
data$Date <- as.Date(data$Date, format = "%d/%m/%Y");View(data)#worked

## Combine Date and Time columns to make unique identifier column "datetime"
data$datetime <- as.POSIXct(paste(data$Date, data$Time), format="%Y-%m-%d %H:%M:%S");View(data)#worked add datetime col

## Open plot to png file
png("plot3.png", width = 480, height = 480)

## Plot 3 and add annotations "plot" calls the plotting window
plot(data$datetime, data$Sub_metering_1, type = "l", ylab = "Energy sub metering", xlab = "")
lines(data$datetime, data$Sub_metering_2, type = "l", col = "red") 
lines(data$datetime, data$Sub_metering_3, type = "l", col ="blue") 
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
lty = c(1,1,1), col = c("black", "red", "blue"))

## Close device
dev.off()
