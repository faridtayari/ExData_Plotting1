electricity_data<-read.csv("household_power_consumption.txt", sep = ";")
ele_data_selected<-electricity_data[(electricity_data$Date=="1/2/2007")|(electricity_data$Date=="2/2/2007"),]

graph1<-function (){
        ele_data_selected$Time<-paste(ele_data_selected$Date, ele_data_selected$Time)
        ele_data_selected$Time<-strptime(ele_data_selected$Time, "%d/%m/%Y %H:%M:%S")
        
        ele_data_selected$Global_active_power<-as.numeric(ele_data_selected$Global_active_power)
        ele_data_selected2<-ele_data_selected[!is.na(ele_data_selected$Global_active_power),]
        ele_data_selected2$Global_active_power<-ele_data_selected2$Global_active_power/1000
        plot(ele_data_selected2$Time,ele_data_selected2$Global_active_power, pch=27, type="o", xlab ="", ylab = "Global Active Power", main= "")
        
}
graph2<-function() {
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
        legend("topright",legend = x,pch="-",col = y, cex=0.6, bty = "n")
}
graph3<-function (){
        ele_data_selected$Time<-paste(ele_data_selected$Date, ele_data_selected$Time)
        ele_data_selected$Time<-strptime(ele_data_selected$Time, "%d/%m/%Y %H:%M:%S")
        
        ele_data_selected$Voltage<-as.numeric(ele_data_selected$Voltage)
        ele_data_selected2<-ele_data_selected[!is.na(ele_data_selected$Voltage),]
        plot(ele_data_selected2$Time,ele_data_selected2$Voltage, pch=27, type="o", xlab ="datetime", ylab = "Voltage", main= "")
}
graph4<-function (){
        ele_data_selected$Time<-paste(ele_data_selected$Date, ele_data_selected$Time)
        ele_data_selected$Time<-strptime(ele_data_selected$Time, "%d/%m/%Y %H:%M:%S")
        
        ele_data_selected$Global_reactive_power<-as.numeric(ele_data_selected$Global_reactive_power)
        ele_data_selected2<-ele_data_selected[!is.na(ele_data_selected$Global_reactive_power),]
        plot(ele_data_selected2$Time,ele_data_selected2$Global_reactive_power, pch=27, type="o", xlab ="datetime", ylab = "Global_reactive_power", main= "")
}
par(mfrow=c(2,2))
par(mar= c(4,4,2,2))
graph1()
graph3()
graph2()
graph4()