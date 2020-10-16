unzip('exdata_data_household_power_consumption.zip')
data<-read.table("household_power_consumption.txt",header = T, sep = ";")
head(data,1)
data07<-data[data$Date %in% c("1/2/2007","2/2/2007"),]
remove(data)
head(data07)

library(data.table)
data<-as.data.table(data07)
data[,datantime:=as.POSIXct(paste(Date,Time),format = "%d/%m/%Y %H:%M:%S")]
png("Plot4.png", width = 480, height = 480)
par(mfcol=c(2,2), mar=c(3,5,3,3))
plot(data$datantime,as.numeric(data$Global_active_power),type = "line",xlab = "",ylab = "Global Active Power")
plot(data$datantime,data$Sub_metering_1,
     xlab = "",
     ylab = "Energy sub metering",
     type = "line",
     col= "black"
)
lines(data$datantime,data$Sub_metering_2,col="red")
lines(data$datantime,data$Sub_metering_3,col = "blue")
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"), lty=1,col = c("black", "red", "blue"))
plot(data$datantime,data$Voltage,type = "line", xlab = "datetime", ylab = "Voltage")
plot(data$datantime,data$Global_reactive_power,type = "line", xlab = 'datetime',ylab = "Global_Reactive_power")
dev.off()