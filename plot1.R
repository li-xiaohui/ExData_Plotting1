#Exploratory Data Analysis
# Course project 1

library(sqldf)
library(data.table)
library(lubridate)

df1 <- fread(filename, na.strings='?')

#dim(use) # 2880 9

#plot 1
use<- subset(df1, Date=="1/2/2007" | Date=="2/2/2007")
use$Date <- dmy(use$Date)
use$Time <- hms(use$Time)
use$Global_active_power <- as.numeric(use$Global_active_power)
use$Global_reactive_power <- as.numeric(use$Global_reactive_power)
use$Voltage <- as.numeric(use$Voltage)
use$Sub_metering_1 <- as.numeric(use$Sub_metering_1)
use$Sub_metering_2 <- as.numeric(use$Sub_metering_2)
use$Sub_metering_3 <- as.numeric(use$Sub_metering_3)

png("plot1.png",width=480,height=480,units="px",bg="transparent")
hist(
  use$Global_active_power,
  col="red", 
  main="Global Active Power", 
  xlab="Global Active Power (kilowatts)",
  ylab="Frequency"
)
dev.off()

