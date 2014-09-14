dataAll <- read.table("household_power_consumption.txt",
                      header = TRUE,
                      sep = ";",
                      na.strings = "?",
                      colClasses = c("character", "character", rep("numeric", 7)))
data <- dataAll[dataAll$Date == "1/2/2007" | dataAll$Date == "2/2/2007", ]

data$Date <- as.Date(data$Date,format='%d/%m/%Y')
data$Time <- strptime(data$Time,format="%H:%M:%S")

p1 <- hist(data$Global_active_power,main="Global Active Power",col="red",xlab="Global Active Power(kilowatts)")
png("plot1.png")
