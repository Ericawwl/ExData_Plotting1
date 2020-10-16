unzip('exdata_data_household_power_consumption.zip')
data<-read.table("household_power_consumption.txt",header = T, sep = ";")
head(data,1)
data07<-data[data$Date %in% c("1/2/2007","2/2/2007"),]
remove(data)
head(data07)

png(file="Plot1.png",height = 480,width = 480)
hist(as.numeric(data07$Global_active_power),col = "red",xlab = "Global Active Power (kilowatts)", main = "Global Active Power")
dev.off()

