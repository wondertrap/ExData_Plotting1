# Coursera 
# Exploratory Data Analysis - Project 1
#

# Preparation - Get and cleaning data
workingDir <- getwd()
df.filename <- paste0(workingDir,"/household_power_consumption.txt")
df.raw = read.csv(df.filename, header=T, sep = ";", na.string="?")
df.raw$Date <- as.Date(df.raw$Date,"%d/%m/%Y")

# Subsetting data
df.data <- subset(df.raw, subset = (Date >="2007-02-01" & Date <= "2007-02-02"))
rm(df.raw)

## and converting dates/times
datetime <- paste(as.Date(df.data$Date), df.data$Time)
df.data$Datetime <- as.POSIXct(datetime)
rm(datetime)

# de->en localization
Sys.setlocale("LC_TIME", "English")

# Open png device
png(filename = "plot3.png", width = 480, height = 480)

# Create Plot

plot(df.data$Datetime, df.data$Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering")
points(df.data$Datetime, df.data$Sub_metering_2, type = "l", xlab = "", ylab = "Energy sub metering", 
       col = "red")
points(df.data$Datetime, df.data$Sub_metering_3, type = "l", xlab = "", ylab = "Energy sub metering", 
       col = "blue")
legend("topright", lty = 1, col = c("black", "red", "blue"), legend = c("Sub_metering_1", 
                                                                        "Sub_metering_2", "Sub_metering_3"))

# Save plot as png bitmap
dev.off()

# en->de localization
Sys.setlocale("LC_TIME", "")
