## load the function library
source("plottings.R")
require(lubridate)

f4 <- parseData()

## plot1
plot1(f4$Global_active_power)
saveplot("plot1.png")
