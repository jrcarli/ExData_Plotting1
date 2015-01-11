cc <- c(rep("character",2),rep("numeric",7))
df <- read.csv("household_power_consumption.txt",
               sep=";",
               colClasses=cc,
               na.strings=c("?"))
feb1 <- as.Date("2007-02-01")
feb2 <- as.Date("2007-02-02")
df$Date <- as.Date(df$Date,"%d/%m/%Y")
mydf <- df[(df$Date==feb1 | df$Date==feb2),]
png(file="plot1.png", bg="transparent")
hist(mydf[,3],
     col="red",
     main="Global Active Power",
     xlab="Global Active Power (kilowatts)")
