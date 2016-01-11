# Plot 4
# This script plot 4 graphs into a graph
library(dplyr)
data <- read.table("household_power_consumption.txt", 
                   sep=";",na.strings ="?", header= TRUE )
data2 <- subset(data, Date=="1/2/2007" | Date=="2/2/2007")

## Do something with the Date and Time formart
as.Date(data2$Date, "%y/%m/%d")
day <- paste(data2$Date, data2$Time)
day<-strptime(day,"%d/%m/%Y %H:%M:%S") 

# 
par(mfrow  =  c(2,2), mar  =  c(4, 4, 2, 1), oma  =  c(0, 0, 2, 0))
# First one
plot(day,data2$Global_active_power, type="l",
     ylab="Global Active Power"
     ,xlab="")
# Second one 
plot(day,data2$Voltage,type="l",
     ylab="Voltage",
     xlab="datetime")
# Third One
plot(day,data2$Sub_metering_1, type="l",xlabel="day",
     ylabel="Energy Sub metering")
lines(day,data2$Sub_metering_2,col="red")
lines(day,data2$Sub_metering_3,col="blue")
legend("topright", 
       c("Sub_metering_1","Sub_metering_2", "Sub_metering_3"), # puts text in the legend
       lty=c(1,1,1), # gives the legend appropriate symbols (lines)
       col=c("black","blue","red"),
       bty = "n") # gives the legend lines the correct color and width

# Fourth One
plot(day,data2$Global_reactive_power,type="l",
     xlab="datetime",
     ylab= "Global_reactive_power")

dev.copy(png,  file  =  "plot4.png")
dev.off()

