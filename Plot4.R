# Reading the data:
database <- read.table("household_power_consumption.txt",sep=";",header=TRUE,na.strings="?")                                                                                              
Date <- paste(database$Date,database$Time)
date <- strptime(Date,"%d/%m/%Y %H:%M:%S")
date2 <- as.Date(date)
names(database)

# Only the observations fo 2007-02-01 and 2007-02-02.
database2 <- database[with(database, Date=="1/2/2007"|Date=="2/2/2007"),]
Date2 <- paste(database2$Date,database2$Time)
date2 <- strptime(Date2,"%d/%m/%Y %H:%M:%S")

# Plot 4:
par(mfrow=c(2,2))
with(database2,{
  plot(date2,database2$Global_active_power,type="l",col="blue",ylab="Global Active Power (kilowatts)",xlab="")
  plot(date2,database2$Voltage,type="l",xlab="datetime",ylab="Voltage")
  plot(date2,database2$Sub_metering_1,type="l",ylab="Energy sub metering",xlab="")
  lines(date2,database2$Sub_metering_2,col="red")
  lines(date2,database2$Sub_metering_3,col="blue")
  legend("topright",col=c("black","red","blue"),lty=1,legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
  plot(date2,database2$Global_reactive_power,type="l",ylab="Global_reactive_power",xlab="datetime")  
})


# Save as PNG File:
dev.copy(png,file = "Plot4.png")
dev.off()
