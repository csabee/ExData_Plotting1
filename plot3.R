## This R script constructs the third plot, as stated in the course project.
##
## The code uses the following libraries:
## 1. lubridate
##
## The code uses the following, additional .R files (included also in the github repo)
## as function libraries:
## 1. plottings.R

## load the function library
source("plottings.R")
require(lubridate)

f4 <- parseData()

## plot3
plot3(f4$fullTime,f4$Sub_metering_1,f4$Sub_metering_2,f4$Sub_metering_3)
saveplot("plot3.png")