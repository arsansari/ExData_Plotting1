# fetch data from text file
powerData <- "../data1/household_power_consumption.txt"
# transform into tabular tabularData
tabularData <- read.table(powerData, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
# filter unnecessary data
subSetData <- tabularData[tabularData$Date %in% c("1/2/2007","2/2/2007") ,]
# combine & transform columns into a single time stamp column in the desired format
datetime <- strptime(paste(subSetData$Date, subSetData$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
# select required column & coerse to numeric
globalActivePower <- as.numeric(subSetData$Global_active_power)
# set image dimension
png("plot2.png", width=480, height=480)
# plot histogram
plot(datetime, globalActivePower, xlab="", ylab="Global Active Power (kilowatts)", type="l")
# shut down the current device
dev.off()