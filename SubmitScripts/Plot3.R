## Script for generating Plot 3 of assignment 1 - Coursera exploratory data analysis

#Import data - two options offered in this script: sqldf or read.delim
#require(sqldf)
#HHElect <- read.csv.sql("household_power_consumption.txt", sql = 'SELECT * FROM file where 
#Date IN ("1/2/2007","2/2/2007")', sep=";")
#HHElect[HHElect == "?"] <- NA

HHElect <- read.delim("household_power_consumption.txt", na.strings="?", sep=";", header=T)
#Subset to: 2007-02-01 and 2007-02-02
HHElect <- subset(HHElect, as.Date(HHElect$Date, "%d/%m/%Y")=="2007-02-01"|
                    as.Date(HHElect$Date, "%d/%m/%Y")=="2007-02-02")
HHElect$Date2 <- strptime(paste(HHElect$Date, HHElect$Time), "%d/%m/%Y %H:%M:%S")

#Plot 3 to png file
png(filename="Plot3.png", width=480,height=480)
plot(HHElect$Date2,HHElect$Sub_metering_1,type="l",xlab=" ",ylab="Energy sub metering")
lines(HHElect$Date2,y=HHElect$Sub_metering_2,ylim=c(0,40),col="red")
lines(HHElect$Date2,y=HHElect$Sub_metering_3,ylim=c(0,40),col="blue")
legend("topright", c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=c(1,1,1),col=c("black", "red", "blue"))
dev.off()