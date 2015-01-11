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
mydf$DateTime <- as.POSIXct(paste(mydf$Date,mydf$Time),format="%Y-%m-%d %H:%M:%S")
png(file="plot2.png", bg="transparent")
with(mydf, {
    plot(DateTime,Global_active_power,type="n",main="",xlab="",ylab="Global Active Power (kilowatts)")
    lines(DateTime,Global_active_power)
})
