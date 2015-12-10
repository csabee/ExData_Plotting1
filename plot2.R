## load the function library
source("plottings.R")
require(lubridate)

f4 <- parseData()

## plot2
plot2(f4$fullTime,f4$Global_active_power)
saveplot("plot2.png")