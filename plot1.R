## Getting full dataset

setwd("C:/Users/Adarsh/Desktop/coursera/eda")
df <- read.csv("household_power_consumption.txt", header=T, sep=';', na.strings="?", 
                      nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')
df <- as.Date(data_full$Date, format="%d/%m/%Y")

## Subsetting the data
df1 <- subset(df, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))
rm(df)

## Converting dates
datetime <- paste(as.Date(df1$Date), data$Time)
df1$Datetime <- as.POSIXct(datetime)

## Plot 1
hist(data$Global_active_power, main="Global Active Power", 
     xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red")

## Saving to file
dev.copy(png, file="plot1.png", height=480, width=480)
dev.off()