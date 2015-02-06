## Script for generating Plot 1 of assignment 1 - exploratory data analysis

#Import data - two options here: sqldf or read.delim. Approx. 0.4 GB ram needed for full dataset
#require(sqldf)
#HHElect <- read.csv.sql("household_power_consumption.txt", sql = 'SELECT * FROM file where 
#Date IN ("1/2/2007","2/2/2007")', sep=";")
#HHElect[HHElect == "?"] <- NA

HHElect <- read.delim("household_power_consumption.txt", na.strings="?", sep=";", header=T)
#Subset to: 2007-02-01 and 2007-02-02
HHElect <- subset(HHElect, as.Date(HHElect$Date, "%d/%m/%Y")=="2007-02-01"|
                    as.Date(HHElect$Date, "%d/%m/%Y")=="2007-02-02")
HHElect$Date2 <- strptime(paste(HHElect$Date, HHElect$Time), "%d/%m/%Y %H:%M:%S")

#Plot 1 to png file
png(filename="Plot1.png", width=480,height=480)
hist(HHElect$Global_active_power, main="Global Active Power", 
     xlab="Global Active Power (kilowatts)", col="red" )
dev.off()