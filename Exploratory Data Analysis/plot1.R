## Load the dataset

data_power <- read.csv("household_power_consumption.txt", header=TRUE, sep=';',nrows=2075259, na.strings="?", 
                      check.names=F, stringsAsFactors=FALSE, comment.char="", quote='\"')

data_power$Date <- as.Date(data_power$Date, format="%d/%m/%Y")

## Subset data

data <- subset(data_power, Date >= "2007-02-01" & Date <= "2007-02-02")

## Convert date formats

datetime <- paste(as.Date(data$Date), data$Time)
data$Datetime <- as.POSIXct(datetime)

## Generate plot1

hist(data$Global_active_power, main="Global Active Power", xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red")

## Save file

dev.copy(png, file="plot1.png", height=480, width=480)
dev.off()
     
  
