## Author: Joe Carli
## Exploratory Data Analysis Course Project 1
cc <- c(rep("character",2),rep("numeric",7))
df <- read.csv("household_power_consumption.txt",
               sep=";",
               colClasses=cc,
               na.strings=c("?"))
feb1 <- as.Date("2007-02-01")
feb2 <- as.Date("2007-02-02")
df$Date <- as.Date(df$Date,"%d/%m/%Y")
mydf <- df[(df$Date==feb1 | df$Date==feb2),]
mydf$DateTime <- as.POSIXct(paste(mydf$Date,mydf$Time),
                            format="%Y-%m-%d %H:%M:%S")
png(file="plot4.png", bg="transparent")
par(mfrow = c(2,2))
with(mydf,{
    ## First plot is global active power
    plot(DateTime,Global_active_power,type="n",
            main="",xlab="",ylab="Global Active Power")
    lines(DateTime,Global_active_power)

    ## Second plot is voltage
    plot(DateTime,Voltage,type="n",xlab="datetime")
    lines(DateTime,Voltage)

    ## Third plot is Energy sub metering
    plot(DateTime,Sub_metering_1,type="n",
            main="",xlab="",ylab="Energy sub metering")
     lines(DateTime,Sub_metering_1,col="black")
     lines(DateTime,Sub_metering_2,col="red")
     lines(DateTime,Sub_metering_3,col="blue")
     legend("topright",
            c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
            lty=1,
            col=c("black","red","blue"),
            bty="n")

    ## Fourth plot is global reactive power
    plot(DateTime,Global_reactive_power,type="n",xlab="datetime")
    lines(DateTime,Global_reactive_power)
})
