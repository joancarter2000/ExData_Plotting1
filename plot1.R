##course project 1
##read in the entire dataset
epc<-read.table("household_power_consumption.txt", sep=";", header=TRUE, colClasses="character")
head(epc)
str(epc)
##subset 1/2/2007 and 2/2/2007 data from the original dataframe 
subepc<-epc[epc$Date=="1/2/2007"|epc$Date=="2/2/2007",]

##change the global active power data from character into numeric
subepc$Global_active_power<-as.numeric(subepc$Global_active_power)

##make plot1
png(filename="plot1.png", width=480, height=480, units="px")
par(cex.axis=0.7, mar=c(5,4,4,2))
hist(subepc$Global_active_power, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.off()
