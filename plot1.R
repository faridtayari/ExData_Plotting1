electricity_data<-read.csv("household_power_consumption.txt", sep = ";")
electricity_data$Date<-as.Date(electricity_data$Date, "%d/%m/%Y")
x<-as.Date("2007-02-01", "%Y-%m-%d")
y<-as.Date("2007-02-02", "%Y-%m-%d")
ele_data_selected<-electricity_data[(electricity_data$Date==x)|(electricity_data$Date==y),]
ele_data_selected$Global_active_power<-as.numeric(ele_data_selected$Global_active_power)
ele_data_selected2<-ele_data_selected[!is.na(ele_data_selected$Global_active_power),]
ele_data_selected2$Global_active_power<-ele_data_selected2$Global_active_power/1000
hist(ele_data_selected2$Global_active_power, col="red",xlab = "Global Active Power (kilowatts)", main= "Global Active Power")
#dev.off()
