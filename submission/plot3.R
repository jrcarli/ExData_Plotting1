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
png(file="plot3.png", bg="transparent")
with(mydf,{
     plot(DateTime,Sub_metering_1,type="n",
          main="",xlab="",ylab="Energy sub metering")
     lines(DateTime,Sub_metering_1,col="black")
     lines(DateTime,Sub_metering_2,col="red")
     lines(DateTime,Sub_metering_3,col="blue")
     legend("topright",
            c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
            lty=1,
            col=c("black","red","blue"))
})
