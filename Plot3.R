unzip('exdata_data_household_power_consumption.zip')
data<-read.table("household_power_consumption.txt",header = T, sep = ";")
head(data,1)
data07<-data[data$Date %in% c("1/2/2007","2/2/2007"),]
remove(data)
head(data07)

library(data.table)
data<-as.data.table(data07)
data[,datantime:=as.POSIXct(paste(Date,Time),format = "%d/%m/%Y %H:%M:%S")]
png("Plot3.png", width = 480, height = 480)
plot(data$datantime,data$Sub_metering_1,
             xlab = "",
     ylab = "Energy sub metering",
     type = "line",
     col= "black"
     )
lines(data$datantime,data$Sub_metering_2,col="red")
lines(data$datantime,data$Sub_metering_3,col = "blue")
dev.off()