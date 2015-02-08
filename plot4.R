data<-read.table("D:\\CourseraCourses\\ExploratoryDataAnalysis\\household_power_consumption.txt", sep=";", header=T, stringsAsFactors=F)
data$Date<-as.Date(data$Date, "%d/%m/%y%y")
data<-subset(data,Date>=as.Date("2007-02-01") & Date<=as.Date("2007-02-02"))
data$timestamp<-strptime(paste(data[,1],data[,2]), "%Y-%m-%d %H:%M:%S")
png("D:\\CourseraCourses\\ExploratoryDataAnalysis\\plot4.png", width = 480, height = 480)
par(mfrow=c(2,2), mar=c(4,4,2,1), oma=c(0,0,2,0))
plot(data[,3]~as.POSIXct(data[,10]), type="l", 
     ylab="Global Active Power (kilowatts)", xlab="")
plot(data[,5]~as.POSIXct(data[,10]), type="l", 
     ylab="Voltage (volt)", xlab="")
plot(data[,7]~as.POSIXct(data[,10]), type="l", 
     ylab="Global Active Power (kilowatts)", xlab="")
lines(data[,8]~as.POSIXct(data[,10]),col='Red')
lines(data[,9]~as.POSIXct(data[,10]),col='Blue')
legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, bty="n",
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
plot(data[,4]~as.POSIXct(data[,10]), type="l", 
     ylab="Global Rective Power (kilowatts)",xlab="")
dev.off()
