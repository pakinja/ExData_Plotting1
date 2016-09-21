library(data.table)
#Read data
data <- fread("household_power_consumption.txt")
#convert Date column to Date/Time object
data$Date<-as.Date(data$Date, "%d/%m/%Y")

#Subset to required dates
data_sub <- subset(data, data$Date >= "2007-02-01" & data$Date <= "2007-02-02")

#Make histogram of Global_active_power
hist(as.numeric(data_sub$Global_active_power), col = "red", xlab = "Global Active Power (kilowatts)",
       main="Global Active Power")
