# Plot2 
# This script creates a graph which shows the global active power of 
# every minute from  the dates 2007-02-01 and 2007-02-02.

library(dplyr)
data <- read.table("household_power_consumption.txt", 
                   sep=";",na.strings ="?", header= TRUE )
data2 <- subset(data, Date=="1/2/2007" | Date=="2/2/2007")

## Do something with the Date and Time formart
as.Date(data2$Date, "%y/%m/%d")
day <- paste(data2$Date, data2$Time)
day<-strptime(day,"%d/%m/%Y %H:%M:%S") 

par(mfrow  =  c(1,1))
with(data2,plot(day,Global_active_power, type="l",
                ylab="Global Active Power (kilowatts)"
                ,xlab=""))

dev.copy(png,  file  =  "plot2.png")
dev.off()
