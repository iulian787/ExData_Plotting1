dafr = read.table(file="../household_power_consumption.txt", na.strings="?", sep=";", header=TRUE, nrows=100000 )
dafr$Date = as.Date(dafr$Date, "%d/%m/%Y")
td = dafr[ (dafr$Date>="2007-02-01" ) & (dafr$Date <="2007-02-02") ,]
dd=td$Date
tt=td$Time
xt=paste(dd, tt) # form one variable, now a character
xt = strptime(xt, "%Y-%m-%d %H:%M:%S")
ylims = range( td$Sub_metering_1)

# to create an array of plots
par(mfrow = c(2, 2))
# controls the size of the fonts; default is too big
par(cex=0.6)
# subplot 1
plot(xt, td$Global_active_power, type="l", 
     ylab="Global Active Power (kilowatts)" , xlab="")

# subplot 2
plot(xt, td$Voltage, type="l",
     ylab="Voltage", xlab="datetime")

# subplot 3
plot(xt, td$Sub_metering_1, type="l", ylim=ylims,
     ylab="Energy sub metering" , xlab="", col = "black")

par(new=T)
plot(xt, td$Sub_metering_2, type="l", ylim=ylims,
     ylab="" , xlab="", col = "red")
par(new=T)
plot(xt, td$Sub_metering_3, type="l", ylim=ylims,
     ylab="" , xlab="", col = "blue")
legend("topright",  col = c("black", "red", "blue"), lwd=1,
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

#subplot 4
plot(xt, td$Global_reactive_power, type="l",
     ylab="Global_reactive_power", xlab="datetime")

dev.copy(png, file = "plot4.png", width=480, height=480 )
dev.off()
par(cex=1) # to not affect other plots later
par(mfrow = c(1, 1))  # reset to default