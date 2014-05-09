setwd("~/Projects/coursera/specialization/datascience/exdata/project1")
# Load DataSet
dataSet <- read.csv("household_power_consumption.txt", colClasses="character", sep=";", na.strings = c("?"))
# Merge column Date and Time into Date/Time : The Pattern is %d/%m/%Y %H:%M:%S 
dataSet$DateTime <- as.POSIXct(paste(dataSet$Date,dataSet$Time), format="%d/%m/%Y %H:%M:%S")
# remove uncessary Date and Time Column from the DATA
# TODO 
dataSetFiltrated <- subset(dataSet, (DateTime >= as.POSIXct("2007-02-01")) &
                             (DateTime <= as.POSIXct("2007-02-03")))

# Plotting starts here
png("plot4.png", width=480, height=480)
par(mfrow=c(2,2))

## ul
plot(dataSetFiltrated$DateTime, as.numeric(dataSetFiltrated$Global_active_power),
     xlab="", ylab="Global Active Power", type="l")

## ur
plot(dataSetFiltrated$DateTime, as.numeric(dataSetFiltrated$Voltage),
     xlab="datetime", ylab="Global Active Power", type="l")

## ll
plot(dataSetFiltrated$DateTime, as.numeric(dataSetFiltrated$Sub_metering_1), type="l", col="black",
     xlab="", ylab="Energy sub metering")
lines(dataSetFiltrated$DateTime, as.numeric(dataSetFiltrated$Sub_metering_2), type="l", col="red")
lines(dataSetFiltrated$DateTime, as.numeric(dataSetFiltrated$Sub_metering_3), type="l", col="blue")
legend("topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       lty=c(1,1,1), col=c("black", "red", "blue"),
       box.lwd=0)

## lr
plot(dataSetFiltrated$DateTime, as.numeric(dataSetFiltrated$Global_reactive_power),
     xlab="datetime", ylab="Global_reactive_power", type="l")

dev.off()
