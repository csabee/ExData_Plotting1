
## load the function library
source("plottings.R")
require(lubridate)

f4 <- parseData()

## plot4 - 4 small plots
par(mfrow=c(2,2))
plot1(f4$Global_active_power,withnew = FALSE)
plot2(f4$fullTime,f4$Global_active_power,withnew = FALSE)
plot3(f4$fullTime,f4$Sub_metering_1,f4$Sub_metering_2,f4$Sub_metering_3,withnew=FALSE, withlegend=FALSE)
plot4(f4$fullTime,f4$Global_reactive_power,withnew = FALSE)

## save it 
saveplot("plot4.png")
