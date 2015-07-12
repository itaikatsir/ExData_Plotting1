## Exploratory Data Analysis - plot2.R
######################################
# Prepare data
rm(list=ls())
data <- read.csv("./household_power_consumption.txt", header=T, sep=';', na.strings="?", 
                      nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')
data$Date <- as.Date(data$Date, format="%d/%m/%Y")

dataSub <- subset(data, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))
rm(data)

datetime <- paste(as.Date(dataSub$Date), dataSub$Time)
dataSub$Datetime <- as.POSIXct(datetime)

# Plot 2
op <- par(no.readonly = TRUE)
plot(dataSub$Global_active_power~dataSub$Datetime, type="l",
     ylab="Global Active Power (kilowatts)", cex.axis = 0.75, xlab="", cex.lab=0.5)
dev.copy(png, file="plot2.png", height=480, width=480)
dev.off()
par(op)
