## Plot3.R
# Read data from file
tmp<-read.table("household_power_consumption.txt",header=TRUE, sep=";",stringsAsFactors=FALSE)

Day1<-"1/2/2007"
Day2<-"2/2/2007"

#sub setting
TDD<-tmp[(tmp$Date == Day1 | tmp$Date == Day2),] # Two days data
rm(tmp)

TDD$date_time<-strptime(paste(TDD$Date,TDD$Time),"%d/%m/%Y %H:%M:%OS")

#plot data
png(filename = "plot3.png", width = 480, height = 480)

with(TDD,{
  Sub_metering_1 <- as.numeric(Sub_metering_1)
  Sub_metering_2 <- as.numeric(Sub_metering_2)
  Sub_metering_3 <- as.numeric(Sub_metering_3)
  ymax = max(Sub_metering_1, Sub_metering_2, Sub_metering_3)
  plot(date_time,Sub_metering_1,type="l",ylim=c(0,ymax),ylab="",xlab="", col="black"); par(new=TRUE)
  plot(date_time,Sub_metering_2,type="l",ylim=c(0,ymax),ylab="",xlab="", col="red"); par(new=TRUE)
  plot(date_time,Sub_metering_3,type="l",ylim=c(0,ymax),ylab="",xlab="", col="blue")
})
labels<-c("Sub_metering_1","Sub_metering_2","Sub_metering_3")
cols<-c("black","red","blue")
legend("topright",lty=1, legend=labels, col=cols)
title(main=NULL, ylab="Energy sub metering")

dev.off()
