## Read the table
d <- read.table("household_power_consumption.txt", 
                header=T, sep=";", na.strings="?")
## Select the two days we need
d <- d[d$Date=="1/2/2007" | d$Date=="2/2/2007",]

## Merge Time with Date and turn d$Date into exact time
d$Date <- strptime(paste(d$Date,d$Time), "%d/%m/%Y %H:%M:%S")

## Plot time by Global Active Power
png('plot2.png')
plot(d$Date, d$Global_active_power, type="l", 
     xlab="", ylab="Global Active Power (kilowatts)")
dev.off()