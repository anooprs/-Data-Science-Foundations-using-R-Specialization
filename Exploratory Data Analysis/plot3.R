## Load the dataset

data_power <- read.csv("household_power_consumption.txt", header=TRUE, sep=';',nrows=2075259, na.strings="?", 
                      check.names=F, stringsAsFactors=FALSE, comment.char="", quote='\"')

data_power$Date <- as.Date(data_power$Date, format="%d/%m/%Y")

## Subset data

data <- subset(data_power, Date >= "2007-02-01" & Date <= "2007-02-02")

## Convert date formats

datetime <- paste(as.Date(data$Date), data$Time)
data$Datetime <- as.POSIXct(datetime)

## Generate plot3.png

with(data, {
    plot(Sub_metering_1~Datetime, type="l", ylab="Global Active Power (kilowatts)", xlab="")
    lines(Sub_metering_2~Datetime,col='Red')
    lines(Sub_metering_3~Datetime,col='Blue')
})
legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

## Save the file

dev.copy(png, file="plot3.png", height=480, width=480)
dev.off()
