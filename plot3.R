## Exploratory Data Analysis - plot3.R
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

# Plot 3
op <- par(no.readonly = TRUE)
png(filename='plot3.png',width=480,height=480,units='px')
with(dataSub, {
  plot(Sub_metering_1~Datetime, type="l",
       ylab="Energy sub metering", xlab="")
  lines(Sub_metering_2~Datetime,col='Red')
  lines(Sub_metering_3~Datetime,col='Blue')
})
legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2,
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.off()
par(op)
