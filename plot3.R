##course project 1
##read in the entire dataset
epc<-read.table("household_power_consumption.txt", sep=";", header=TRUE, colClasses="character")
head(epc)
str(epc)
##subset 1/2/2007 and 2/2/2007 data from the original dataframe 
subepc<-epc[epc$Date=="1/2/2007"|epc$Date=="2/2/2007",]

##using lubridate package which is very helpful in dealing with date/time

library(lubridate)
##combine Date and Time to make a new variable "Day"
subepc$Day<-paste(subepc$Date, subepc$Time, sep=" ")
##convert "Day" into POSIXct 
subepc$Day<-dmy_hms(subepc$Day)

##make plot3
##convert related variable to numeric
subepc$Sub_metering_1<-as.numeric(subepc$Sub_metering_1)
subepc$Sub_metering_2<-as.numeric(subepc$Sub_metering_2)
subepc$Sub_metering_3<-as.numeric(subepc$Sub_metering_3)

png(filename="plot3.png", width=480, height=480, units="px")
par(cex.axis=0.7, mar=c(5,4,4,2))
with(plot(subepc$Day, subepc$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering"), 
     {lines(subepc$Day,subepc$Sub_metering_2, col="red")
      lines(subepc$Day,subepc$Sub_metering_3, col="blue")})
      
legend("topright", lty=1, col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), cex=0.8)
dev.off()