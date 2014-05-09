setwd("~/Projects/coursera/specialization/datascience/exdata/project1")
# Load DataSet
dataSet <- read.csv("household_power_consumption.txt", colClasses="character", sep=";", na.strings = c("?"))
# Merge column Date and Time into Date/Time : The Pattern is %d/%m/%Y %H:%M:%S 
dataSet$DateTime <- as.POSIXct(paste(dataSet$Date,dataSet$Time), format="%d/%m/%Y %H:%M:%S")
# remove uncessary Date and Time Column from the DATA
# TODO 
dataSetFiltrated <- subset(dataSet, (DateTime >= as.POSIXct("2007-02-01")) &
                     (DateTime <= as.POSIXct("2007-02-03")))

png("plot1.png", width=480, height=480)
hist(as.numeric(dataSetFiltrated$Global_active_power),
     main="Global Active Power",
     xlab="Global Active Power (kilowatts)",
     ylab="Frequency",
     col="red" 
)
dev.off()