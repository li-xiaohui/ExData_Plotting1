library(sqldf)
library(data.table)
library(lubridate)

df1 <- fread(filename, na.strings='?')
## Converting dates
# subset again to use paste function
use<- subset(df1, Date=="1/2/2007" | Date=="2/2/2007")
use$datetime <- paste(use$Date, use$Time)
use$datetime <- dmy_hms(use$datetime)
use$Date <- dmy(use$Date)
use$Time <- hms(use$Time)
use$Global_active_power <- as.numeric(use$Global_active_power)
use$Global_reactive_power <- as.numeric(use$Global_reactive_power)
use$Voltage <- as.numeric(use$Voltage)
use$Sub_metering_1 <- as.numeric(use$Sub_metering_1)
use$Sub_metering_2 <- as.numeric(use$Sub_metering_2)
use$Sub_metering_3 <- as.numeric(use$Sub_metering_3)

# Plot 3
png("plot3.png",width=480,height=480, units="px",bg="transparent")
plot(use$datetime, use$Sub_metering_1,  type="l",
     xlab="",
     ylab="Energy sub metering")

lines(use$datetime, 
      use$Sub_metering_2,
      type="l",
      col="red"
)
lines(use$datetime, 
      use$Sub_metering_3,
      type="l",
      col="blue"
)
dev.off()