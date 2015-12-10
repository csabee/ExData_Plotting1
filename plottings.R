## function:    saveplot
## 
## description:
##
## This function saves a plot as a PNG, from a new graphics "device" panel
##
## Parameters:
## name         The name of the file to save. It will be saved in the current work directory.
## sizex        The width of the PNG file. Default: 480px
## sizey        The height of the PNG file. Default: 480px
## 
## return       void
saveplot <- function(name, sizex = 480, sizey = 480)
{
    dev.copy(png, file=name, width = sizex, height = sizey )
    dev.off()
}

## function:    plot1
## 
## description:
##
## This function draws the first plot as stated in the course project.
##
## Parameters:
## power        The "Global Active Power" vector from a dataset.
## withnew      Indicates, whether the plot should be drawn on a new "device". Default: TRUE
## 
## return       void
plot1 <- function(power, withnew = TRUE)
{
    if(withnew)
    {
        dev.new()
    }
    
    hist(power,main="Global Active Power", col="red", xlab="Global Active Power (kilowatts)")
}

## function:    plot2
## 
## description:
##
## This function draws the second plot as stated in the course project.
##
## Parameters:
## time         The fulltime vector constructed from the Date&Time from a dataset.
## power        The "Global Active Power" vector from a dataset.
## withnew      Indicates, whether the plot should be drawn on a new "device". Default: TRUE
## 
## return       void
plot2 <- function(time, power, withnew = TRUE)
{
    
    if(withnew)
    {
        dev.new()
    }
    
    par(pch=22, col="black")
    plot(time,power,type="n",main="Plot 2",ylab="Global Active Power (kilowatts)",xlab="")
    lines(time,power, type="l")
}

## function:    plot3
## 
## description:
##
## This function draws the third plot as stated in the course project.
##
## Parameters:
## time         The fulltime vector constructed from the Date&Time from a dataset.
## metering1    The "Sub_Metering_1" vector from a dataset.
## metering2    The "Sub_Metering_2" vector from a dataset.
## metering3    The "Sub_Metering_3" vector from a dataset.
## withnew      Indicates, whether the plot should be drawn on a new "device". Default: TRUE
## 
## return       void
plot3 <- function(time, metering1, metering2, metering3, withnew = TRUE, withlegend = TRUE)
{
    if(withnew)
    {
        dev.new()
    }
    
    plot(time,metering1,type="l", xlab="", ylab="Energy sub metering")
    lines(time,metering2,col="red")
    lines(time,metering3,col="blue")
    
    if(withlegend)
    {
        legend("topright", col=c("black","red","blue"), c("Sub_metering_1  ","Sub_metering_2  ", "Sub_metering_3  "),lty=c(1,1), lwd=c(1,1))
    }
    
}

## function:    plot4
## 
## description:
##
## This function draws the fourth (smaller) plot as stated in the course project.
##
## Parameters:
## time         The fulltime vector constructed from the Date&Time from a dataset.
## power        The "Global Active Power" vector from a dataset.
## withnew      Indicates, whether the plot should be drawn on a new "device". Default: TRUE
## 
## return       void
plot4 <- function(time,power,withnew=FALSE)
{
    if(withnew)
    {
        dev.new()
    }
    
    plot(time,power, type="l", xlab="datetime", ylab="Global_reactive_power")
}

## function:    parseData
## 
## description:
## This .R function does the following:
##
## 1. loads a previously downloaded file from the current working directory 
##      (currently called household_power_consumption.txt)
## 2. makes some transformations and cleanup on the dataset
parseData <- function()
{
    ## initial load of the dataset
    colClasses <- c("character", "character", "character", "character", "character", "character", "character", "character", "character")
    f <- read.csv2(file = "household_power_consumption.txt", sep=";", dec=".", header=TRUE, colClasses = colClasses)
    
    ## we create a new data frame, where the date column is formatted correctly
    ## this is required, because of different OS timezone and dateformat settings
    f2 <- data.frame(Date <- as.Date(f$Date, format="%d/%m/%Y"), Time <- f$Time, Global_active_power <- f$Global_active_power, Global_reactive_power <- f$Global_reactive_power, Voltage <- f$Voltage,Global_intensity <- f$Global_intensity, Sub_metering_1 <- f$Sub_metering_1, Sub_metering_2<- f$Sub_metering_2, Sub_metering_3 <- f$Sub_metering_3,stringsAsFactors=FALSE)
    colnames(f2) <- c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
    
    ## We filter the dataset for the required dates only: 2007-02-01 00:00 to 2007-02-02 23:59
    f3 <- subset(f2, f2$Date > as.Date("2007-01-31"))
    f3 <- subset(f3, f3$Date < as.Date("2007-02-03"))
    
    ## we convert the available columns as necessary
    f4 <- data.frame(Date<-f3$Date,Time<-f3$Time,Global_active_power<-as.double(f3$Global_active_power), Global_reactive_power <- as.double(f3$Global_reactive_power),Voltage<-as.double(f3$Voltage),Global_intensity<-as.double(f3$Global_intensity),Sub_metering_1<-as.double(f3$Sub_metering_1),Sub_metering_2<-as.double(f3$Sub_metering_2),Sub_metering_3<-as.double(f3$Sub_metering_3),stringsAsFactors = FALSE)
    colnames(f4) <- c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
    
    ## we create iso dates from column Date and column time
    f4$parsedTime <- strptime(f4$Time, format="%H:%M:%S")
    f4$fullTime <- ISOdatetime(year(f4$Date), month(f4$Date), day(f4$Date), hour(f4$parsedTime), minute(f4$parsedTime), second(f4$parsedTime))
    
    return(f4)
}