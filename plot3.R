## read data
ec <- read.table("household_power_consumption.txt", colClasses = c("character", "character","numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric"),sep=";",header=T,na.strings= "?")
## add datetime column
ec$datetime <- strptime(paste(ec$Date, ec$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
## convert Date column to Date data type
ec$Date <- as.Date(ec$Date, "%d/%m/%Y")
## subset data for Feb 1, 2007 and Feb 2, 2007
pd <-subset(ec, Date == as.Date("2007-02-01") | Date == as.Date("2007-02-02"))
## plot Sub_metering_1 data
png(file="plot3.png",width=480,height=480)
plot(pd$datetime,pd$Sub_metering_1 ,type="l",col="black", ylab="Energy sub metering", xlab="")
## add Sub_metering_2 data
lines(pd$datetime,pd$Sub_metering_2 ,type="l",col="red")
## add Sub_metering_3 data
lines(pd$datetime,pd$Sub_metering_3 ,col="blue")
## add legened
legend("topright",lty=1,col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
## close device
dev.off()