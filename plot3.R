#Read and clean data
consumption <- read.table("household_power_consumption.txt",skip=66637,nrows = 2880, sep=";")
names(consumption) <- c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")
consumption$date_time <- strptime(paste(consumption$Date, consumption$Time),format = "%d/%m/%Y %H:%M:%S")


#Make the plot
with(consumption, plot(date_time, type = "l", Sub_metering_1 ,xlab = "", ylab = "Energy sub metering"))
with(consumption, points(date_time, type = "l", Sub_metering_2, col="red"))
with(consumption, points(date_time, type = "l", Sub_metering_3, col="blue"))
legend("topright", lty=1, col=c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), cex=0.75, y.intersp=0.5)


dev.copy(png,file="plot3.png")
dev.off()