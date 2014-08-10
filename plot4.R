## Read the table
d <- read.table("household_power_consumption.txt", 
                header=T, sep=";", na.strings="?")
## Select the two days we need
d <- d[d$Date=="1/2/2007" | d$Date=="2/2/2007",]

## Merge Time with Date and turn d$Date into exact time
d$Date <- strptime(paste(d$Date,d$Time), "%d/%m/%Y %H:%M:%S")

## Initalise the 4 plot window
png('plot4.png')
par(mfrow=c(2,2))

## Plot 1: time by Global active power
plot(d$Date, d$Global_active_power, type="l", 
     xlab="", ylab="Global Active Power")

## Plot 2: time by Voltage
plot(d$Date, d$Voltage, type="l", xlab="datetime",
     ylab="Voltage")

## Plot 3: time by Energy by sub plot(d$Date, d$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")
plot(d$Date, d$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")
lines(d$Date, d$Sub_metering_2, col="red")
lines(d$Date, d$Sub_metering_3, col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", 
                     "Sub_metering_3"), lty=c(1,1), 
       col=c("black", "red", "blue"), bty="n")

## Plot 4: time by Global reactive power
plot(d$Date, d$Global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power")

## Write to png
dev.off()