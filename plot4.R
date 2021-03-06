dataAll <- read.table("household_power_consumption.txt",
                      header = TRUE,
                      sep = ";",
                      na.strings = "?",
                      colClasses = c("character", "character", rep("numeric", 7)))
data <- dataAll[dataAll$Date == "1/2/2007" | dataAll$Date == "2/2/2007", ]
data$newvar <- strptime(paste(data$Date, data$Time), format="%d/%m/%Y %H:%M:%S")
data$Date <- as.Date(data$Date,format='%d/%m/%Y')
data$Time <- strptime(data$Time,format="%H:%M:%S")

png(filename='plot4.png',height=480,width=480)
par(mfcol=c(2,2))
plot(y=data$Global_active_power,x=data$newvar, type = "l",ylab = "Global Active Power (kilowatts)",xlab="")

plot(x=data$newvar,y=data$Sub_metering_1,ylab="Energy Sub Metering",type='l',xlab="")
lines(y=data$Sub_metering_2,x=data$newvar,col='red')
lines(y=data$Sub_metering_3,x=data$newvar,col='blue')
legend("topright",lty=1,col=c('black','blue','red'),legend=c('Sub_metering_1','Sub_metering_2','Sub_metering_3'))

plot(y=data$Voltage,x=data$newvar, type = "l",ylab = "Voltage",xlab="datetime",ylim=c(234,246))

plot(y=data$Global_reactive_power,x=data$newvar, type = "l",ylab = "Global_active_power",xlab="datetime",ylim=c(0,0.5))

dev.off()