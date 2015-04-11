##course project 1
##read in the entire dataset
epc<-read.table("household_power_consumption.txt", sep=";", header=TRUE, colClasses="character")
head(epc)
str(epc)
##subset 1/2/2007 and 2/2/2007 data from the original dataframe 
subepc<-epc[epc$Date=="1/2/2007"|epc$Date=="2/2/2007",]

##change the "global active power" data from character into numeric
subepc$Global_active_power<-as.numeric(subepc$Global_active_power)

##using lubridate package which is very helpful in dealing with date/time

library(lubridate)
##combine Date and Time to make a new variable "Day"
subepc$Day<-paste(subepc$Date, subepc$Time, sep=" ")
##convert "Day" into POSIXct 
subepc$Day<-dmy_hms(subepc$Day)

##convert related variable to numeric
subepc$Sub_metering_1<-as.numeric(subepc$Sub_metering_1)
subepc$Sub_metering_2<-as.numeric(subepc$Sub_metering_2)
subepc$Sub_metering_3<-as.numeric(subepc$Sub_metering_3)

##make plot4
##convert related varibale to numeric
subepc$Voltage<-as.numeric(subepc$Voltage)
subepc$Global_reactive_power<-as.numeric(subepc$Global_reactive_power)

png(filename="plot4.png", width=480, height=480, units="px")

par(mfrow=c(2,2), cex.axis=0.7, mar=c(5,4,4,2))
##draw top left graph
plot(subepc$Day, subepc$Global_active_power, type="l", xlab="", ylab="Global Active Power")
##draw top right graph
plot(subepc$Day, subepc$Voltage, type="l", xlab="datetime", ylab="Voltage")
##draw lower left graph
with(plot(subepc$Day, subepc$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering"), 
     {lines(subepc$Day,subepc$Sub_metering_2, col="red")
      lines(subepc$Day,subepc$Sub_metering_3, col="blue")})
      
legend("topright", lty=1, col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), cex=0.6)
##draw lower right graph
plot(subepc$Day, subepc$Global_reactive_power, type="l", xlab="datetime", ylab="Global_Reactive_Power")

dev.off()
