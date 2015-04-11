dafr = read.table(file="../household_power_consumption.txt", na.strings="?", sep=";", header=TRUE, nrows=100000 )
dafr$Date = as.Date(dafr$Date, "%d/%m/%Y")
twodays = dafr[ (dafr$Date>="2007-02-01" ) & (dafr$Date <="2007-02-02") ,]
hist(twodays$Global_active_power, main="Global Active Power", xlab="Global Active Power(kilowatts)", col="red")
dev.copy(png, file = "plot1.png", width=480, height=480 )
dev.off()