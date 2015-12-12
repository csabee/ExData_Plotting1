## This R script constructs the first plot, as stated in the course project.
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

## plot1
plot1(f4$Global_active_power)
saveplot("plot1.png")
