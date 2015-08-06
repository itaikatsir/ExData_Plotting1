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
png(filename='plot2.png',width=480,height=480,units='px')
plot(dataSub$Datetime, dataSub$Global_active_power, type="l",
     ylab="Global Active Power (kilowatts)", xlab="")
dev.off()
par(op)
