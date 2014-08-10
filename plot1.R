## Read the table
d <- read.table("household_power_consumption.txt", 
                header=T, sep=";", na.strings="?")
## Select the two days we need
d <- d[d$Date=="1/2/2007" | d$Date=="2/2/2007",]

## Merge Time with Date and turn d$Date into exact time
d$Date <- strptime(paste(d$Date,d$Time), "%d/%m/%Y %H:%M:%S")

## Plot the histogram in red with title and x-labels and write to file
png('plot1.png')
hist(d$Global_active_power, col="red", main="Global Active Power", 
     xlab="Global Active Power (kilowatts)")
dev.off()