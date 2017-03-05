#Read and clean data
consumption <- read.table("household_power_consumption.txt",skip=66637,nrows = 2880, sep=";")
names(consumption) <- c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")
consumption$datetime <- strptime(paste(consumption$Date, consumption$Time),format = "%d/%m/%Y %H:%M:%S")


#Adjust to fit 4 plots
par(mfrow=c(2,2))

#Plot 1
with(consumption, plot(datetime, type = "l", Global_active_power,xlab = "", ylab = "Global Active Power (kilowatts)"))

#Plot 2
with(consumption, plot(datetime, type = "l", Voltage, ylab = "Global Active Power (kilowatts)"))

#Plot 3
with(consumption, plot(datetime, type = "l", Sub_metering_1 ,xlab = "", ylab = "Energy sub metering"))
with(consumption, points(datetime, type = "l", Sub_metering_2, col="red"))
with(consumption, points(datetime, type = "l", Sub_metering_3, col="blue"))
legend("topright", lty=1, col=c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),cex = 0.7, bty="n", y.intersp=0.3, inset=c(-0.2,-0.1))

#Plot 4
with(consumption, plot(datetime, type = "l", Global_reactive_power))

#Copy to a png file
dev.copy(png,file="plot4.png")
dev.off()