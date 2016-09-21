library(data.table)
#Read data
data <- fread("household_power_consumption.txt")
#convert Date column to Date/Time object
data$Date<-as.Date(data$Date, "%d/%m/%Y")

#Subset to required dates
data_sub <- subset(data, data$Date >= "2007-02-01" & data$Date <= "2007-02-02")

x <- as.POSIXct(paste(data_sub$Date,data_sub$Time), format="%Y-%m-%d %H:%M:%S")

par(mfrow=c(2,2))
plot(x, as.numeric(data_sub$Global_active_power), type="l", ylab="Global Active Power (kilowatts)")
plot(x, as.numeric(data_sub$Voltage), type = "l",xlab="datetime", ylab="Voltage" )
#####
plot(x, as.numeric(data_sub$Sub_metering_1), type="l", ylab="Energy sub metering",
     ylim=c(0, 40))
par(new = T)
plot(x, as.numeric(data_sub$Sub_metering_2), type="l", ylab="Energy sub metering",
     ylim=c(0, 40), col = "red")
par(new=T)
plot(x, as.numeric(data_sub$Sub_metering_3), type="l", ylab="Energy sub metering",
     ylim=c(0, 40), col = "blue")

legend("topright", legend=c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"),
       col=c("black","red", "blue"), lty=1, cex=0.8)

plot(x, as.numeric(data_sub$Global_reactive_power), type = "l",xlab="datetime", ylab="Global_reactive_power" )
