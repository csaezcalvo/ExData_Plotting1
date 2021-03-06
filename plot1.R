#Read and clean data
consumption <- read.table("household_power_consumption.txt",skip=66637,nrows = 2880, sep=";")
names(consumption) <- c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")
consumption$Date <- as.Date(consumption$Date)

#Make the plot
with(consumption, hist(Global_active_power, col="red",xlab="Global Active Power (kilowatts)", main="Global Active Power"))
dev.copy(png,file="plot1.png")
dev.off()