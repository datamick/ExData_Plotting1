
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

## Plot 2 and add annotations
plot(data$datetime, data$Global_active_power, type = "l", 
     ylab = "Global Active Power (kilowatts)", xlab = "")

## Copy plot to png file
dev.copy(png, file = "plot2.png", width = 480, height = 480)

## Close device
dev.off()
