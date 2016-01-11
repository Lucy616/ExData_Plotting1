# Plot3
# This script creates a graph which shows there energy sub metering of 
# every minute from  the dates 2007-02-01 and 2007-02-02.

library(dplyr)
data <- read.table("household_power_consumption.txt", 
                   sep=";",na.strings ="?", header= TRUE )
data2 <- subset(data, Date=="1/2/2007" | Date=="2/2/2007")

## Do something with the Date and Time formart
as.Date(data2$Date, "%y/%m/%d")
day <- paste(data2$Date, data2$Time)
day<-strptime(day,"%d/%m/%Y %H:%M:%S") 



# The graph 
par(mfrow  =  c(1,1))

plot(day,data2$Sub_metering_1, type="l",xlabel="day",
     ylabel="Energy Sub metering")
lines(day,data2$Sub_metering_2,col="red")
lines(day,data2$Sub_metering_3,col="blue")

legend("topright", 
       c("Sub_metering_1","Sub_metering_2", "Sub_metering_3"), # puts text in the legend
       lty=c(1,1,1), # gives the legend appropriate symbols (lines)
       col=c("black","blue","red")) # gives the legend lines the correct color and width

dev.copy(png,  file  =  "plot3.png")
dev.off()
