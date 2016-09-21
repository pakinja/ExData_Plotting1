library(data.table)
#Read data
data <- fread("household_power_consumption.txt")
#convert Date column to Date/Time object
data$Date<-as.Date(data$Date, "%d/%m/%Y")

#Subset to required dates
data_sub <- subset(data, data$Date >= "2007-02-01" & data$Date <= "2007-02-02")

x <- as.POSIXct(paste(data_sub$Date,data_sub$Time), format="%Y-%m-%d %H:%M:%S")

plot(x, as.numeric(data_sub$Global_active_power), type="l", ylab="Global Active Power (kilowatts)")
