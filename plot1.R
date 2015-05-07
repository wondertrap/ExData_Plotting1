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

# Open png device
png(filename = "plot1.png", width = 480, height = 480)
# Create Plot
hist(df.data$Global_active_power, col = "red", main = paste("Global Active Power"), xlab = "Global Active Power (kilowatts)")
# Save plot as png bitmap
dev.off()
