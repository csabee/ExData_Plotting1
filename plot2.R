## This R script constructs the second plot, as stated in the course project.
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

## plot2
plot2(f4$fullTime,f4$Global_active_power)
saveplot("plot2.png")