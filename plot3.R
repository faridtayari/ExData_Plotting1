electricity_data<-read.csv("household_power_consumption.txt", sep = ";")
ele_data_selected<-electricity_data[(electricity_data$Date=="1/2/2007")|(electricity_data$Date=="2/2/2007"),]

ele_data_selected$Time<-paste(ele_data_selected$Date, ele_data_selected$Time)
ele_data_selected$Time<-strptime(ele_data_selected$Time, "%d/%m/%Y %H:%M:%S")

ele_data_selected$Sub_metering_1<-as.numeric(ele_data_selected$Sub_metering_1)
ele_data_selected$Sub_metering_2<-as.numeric(ele_data_selected$Sub_metering_2)
ele_data_selected$Sub_metering_3<-as.numeric(ele_data_selected$Sub_metering_3)

ele_data_selected2<-ele_data_selected[!is.na(ele_data_selected$Sub_metering_1),]
ele_data_selected2<-ele_data_selected[!is.na(ele_data_selected$Sub_metering_2),]
ele_data_selected2<-ele_data_selected[!is.na(ele_data_selected$Sub_metering_3),]

plot(ele_data_selected2$Time,ele_data_selected2$Sub_metering_1, pch=27, type="o", xlab ="", ylab = "Energy sub metering", main= "")
points(ele_data_selected2$Time,ele_data_selected2$Sub_metering_2, pch=27, type="o", xlab ="", ylab = "Energy sub metering", main= "", col="red")
points(ele_data_selected2$Time,ele_data_selected2$Sub_metering_3, pch=27, type="o", xlab ="", ylab = "Energy sub metering", main= "", col="blue")

x<-c("Sub_metering_1","Sub_metering_2","Sub_metering_3")
y<-c("black","red","blue")
legend("topright",legend = x,pch="-",col = y)