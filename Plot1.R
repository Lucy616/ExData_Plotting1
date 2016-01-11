## Plot1
# This script create a histogram of Global Active Power from  the dates 2007-02-01 and 2007-02-02.
library(dplyr)
# read in data,  and subset the data we use in this analysis (1/2/2007 - 2/2007)
data <- read.table("household_power_consumption.txt", 
                   sep=";",na.strings ="?", header= TRUE )
data2 <- subset(data, Date=="1/2/2007" | Date=="2/2/2007")
# create the histogram
par(mfrow  =  c(1,1))
hist(data2$Global_active_power, 
     col  =  "red",
     breaks = 12,
     main = "Global Active Power",
     xlab="Global Active Power (kilowatts)")
dev.copy(png,  file  =  "plot1.png")
dev.off()
