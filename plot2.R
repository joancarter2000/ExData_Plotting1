##course project 1
##read in the entire dataset
epc<-read.table("household_power_consumption.txt", sep=";", header=TRUE, colClasses="character")
head(epc)
str(epc)
##subset 1/2/2007 and 2/2/2007 data from the original dataframe 
subepc<-epc[epc$Date=="1/2/2007"|epc$Date=="2/2/2007",]

##change the "global active power" data from character into numeric
subepc$Global_active_power<-as.numeric(subepc$Global_active_power)

##make plot2
##using lubridate package which is very helpful in dealing with date/time

library(lubridate)
##combine Date and Time to make a new variable "Day"
subepc$Day<-paste(subepc$Date, subepc$Time, sep=" ")
##convert "Day" into POSIXct 
subepc$Day<-dmy_hms(subepc$Day)

##make plot2
png(filename="plot2.png", width=480, height=480, units="px")
par(cex.axis=0.7, mar=c(5,4,4,2))
plot(subepc$Day, subepc$Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()
