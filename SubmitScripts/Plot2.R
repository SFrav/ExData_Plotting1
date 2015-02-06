## Script for generating Plot 2 of assignment 1 - Coursera exploratory data analysis

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

#Plot 2 to png file
png(filename="Plot2.png", width=480,height=480)
plot(HHElect$Date2, HHElect$Global_active_power, type="l", xlab="", 
     ylab="Global Active Power (kilowatts)")
dev.off()

