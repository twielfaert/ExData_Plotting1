## Read the table
d <- read.table("household_power_consumption.txt", 
                header=T, sep=";", na.strings="?")
## Select the two days we need
d <- d[d$Date=="1/2/2007" | d$Date=="2/2/2007",]

## Merge Time with Date and turn d$Date into exact time
d$Date <- strptime(paste(d$Date,d$Time), "%d/%m/%Y %H:%M:%S")

## Plot time by submetering and add legend
png('plot3.png')
plot(d$Date, d$Sub_metering_1, type="l", xlab="", 
     ylab="Energy sub metering")
lines(d$Date, d$Sub_metering_2, col="red")
lines(d$Date, d$Sub_metering_3, col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", 
      "Sub_metering_3"), lty=c(1,1), col=c("black", "red", "blue"))
dev.off()