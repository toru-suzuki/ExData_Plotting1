## Plot2.R
#read data file
tmp<-read.table("household_power_consumption.txt",header=TRUE, sep=";",stringsAsFactors=FALSE)

Day1<-"1/2/2007"
Day2<-"2/2/2007"

#sub setting
TDD<-tmp[(tmp$Date == Day1 | tmp$Date == Day2),] # Two days data
rm(tmp)
TDD$date_time<-strptime(paste(TDD$Date,TDD$Time),"%d/%m/%Y %H:%M:%OS")

#plot data
png(filename = "plot2.png", width = 480, height = 480)
plot(TDD$date_time, as.numeric(TDD$Global_active_power), type="l",
     xlab="", ylab="Global Active Power (kilowatts)")
dev.off()
