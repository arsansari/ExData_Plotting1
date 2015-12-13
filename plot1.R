# fetch data from text file
powerData <- "../data1/household_power_consumption.txt"
# transform into tabular data
tabularData <- read.table(powerData, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
# filter unnecessary data
subSetData <- tabularData[tabularData$Date %in% c("1/2/2007","2/2/2007") ,]
# explicit coerse to numeric
globalActivePower <- as.numeric(subSetData$Global_active_power)
# set image dimension
png("plot1.png", width=480, height=480)
# plot histogram
hist(globalActivePower, main="Global Active Power", xlab="Global Active Power (kilowatts)", col="red")
# shut down the current device 
dev.off()