## Plot1.R
#read data
tmp<-read.table("household_power_consumption.txt",header=TRUE, sep=";",stringsAsFactors=FALSE)

Day1<-"1/2/2007"
Day2<-"2/2/2007"

#sub setting
TDD<-tmp[(tmp$Date == Day1 | tmp$Date == Day2),] # Two days data
rm(tmp)

#plot graph
TDD$date_time<-strptime(paste(TDD$Date,TDD$Time),"%d/%m/%Y %H:%M:%OS")
png(filename = "plot1.png", width = 480, height = 480)
hist(as.numeric(TDD$Global_active_power),col="red",
     main="Global Active Power",xlab="Global Active Power (kilowatts)")
dev.off()
