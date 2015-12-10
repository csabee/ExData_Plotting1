## load the function library
source("plottings.R")
require(lubridate)

f4 <- parseData()

## plot3
plot3(f4$fullTime,f4$Sub_metering_1,f4$Sub_metering_2,f4$Sub_metering_3)
saveplot("plot3.png")