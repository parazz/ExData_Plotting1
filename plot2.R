dataAll <- read.table("household_power_consumption.txt",
                      header = TRUE,
                      sep = ";",
                      na.strings = "?",
                      colClasses = c("character", "character", rep("numeric", 7)))
data <- dataAll[dataAll$Date == "1/2/2007" | dataAll$Date == "2/2/2007", ]
data$newvar <- strptime(paste(data$Date, data$Time), format="%d/%m/%Y %H:%M:%S")
data$Date <- as.Date(data$Date,format='%d/%m/%Y')
data$Time <- strptime(data$Time,format="%H:%M:%S")

png(filename='plot2.png',height=480,width=480)
plot(y=data$Global_active_power,x=data$newvar, type = "l",ylab = "Global Active Power (kilowatts)",xlab="")
dev.off()

