# load data from text file
powerData <- "../data1/household_power_consumption.txt"
# transform into tabular data
powerData <- read.table(powerData, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
# filter unnecessary data
subSetData <- powerData[powerData$Date %in% c("1/2/2007","2/2/2007") ,]
# combine & transform columns into a single time stamp column in the desired format
datetime <- strptime(paste(subSetData$Date, subSetData$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
# select required columns & coerse to numeric
globalActivePower <- as.numeric(subSetData$Global_active_power)
subMetering1 <- as.numeric(subSetData$Sub_metering_1)
subMetering2 <- as.numeric(subSetData$Sub_metering_2)
subMetering3 <- as.numeric(subSetData$Sub_metering_3)
# set image dimension
png("plot3.png", width=480, height=480)
# plot histogram
plot(datetime, subMetering1, type="l", ylab="Energy Submetering", xlab="")
lines(datetime, subMetering2, type="l", col="red")
lines(datetime, subMetering3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))
# shut down the current device
dev.off()