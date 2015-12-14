electricity_data<-read.csv("household_power_consumption.txt", sep = ";")
ele_data_selected<-electricity_data[(electricity_data$Date=="1/2/2007")|(electricity_data$Date=="2/2/2007"),]

ele_data_selected$Time<-paste(ele_data_selected$Date, ele_data_selected$Time)
ele_data_selected$Time<-strptime(ele_data_selected$Time, "%d/%m/%Y %H:%M:%S")

ele_data_selected$Global_active_power<-as.numeric(ele_data_selected$Global_active_power)
ele_data_selected2<-ele_data_selected[!is.na(ele_data_selected$Global_active_power),]
ele_data_selected2$Global_active_power<-ele_data_selected2$Global_active_power/1000
plot(ele_data_selected2$Time,ele_data_selected2$Global_active_power, pch=27, type="o", xlab ="", ylab = "Global Active Power (kilowatts)", main= "Global Active Power")
