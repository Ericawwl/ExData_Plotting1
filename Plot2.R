unzip('exdata_data_household_power_consumption.zip')
data<-read.table("household_power_consumption.txt",header = T, sep = ";")
head(data,1)
data07<-data[data$Date %in% c("1/2/2007","2/2/2007"),]
remove(data)

data07$datentime<-as.POSIXct(paste(data07$Date,data07$Time))
plot(data07$datentime,as.numeric(data07$Global_active_power))
head(data07)


library(data.table)
data<-as.data.table(data07)
data[,datantime:=as.POSIXct(paste(Date,Time),format = "%d/%m/%Y %H:%M:%S")]
png("Plot2.png", height =480, width=480)
plot(data$datantime,as.numeric(data$Global_active_power),type = "line",xlab = "",ylab = "Global Active Power (kilowatts)")
dev.off()
