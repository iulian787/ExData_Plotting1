dafr = read.table(file="../household_power_consumption.txt", na.strings="?", sep=";", header=TRUE, nrows=100000 )
dafr$Date = as.Date(dafr$Date, "%d/%m/%Y")
td = dafr[ (dafr$Date>="2007-02-01" ) & (dafr$Date <="2007-02-02") ,]
dd=td$Date
tt=td$Time
xt=paste(dd, tt) # form one variable, now a character
xt = strptime(xt, "%Y-%m-%d %H:%M:%S")
ylims = range( td$Sub_metering_1)
plot(xt, td$Sub_metering_1, type="l", ylim=ylims,
     ylab="Energy sub metering" , xlab="", col = "black")
#par(new=T)  # keep the plot, do not overwrite
points(xt, td$Sub_metering_2, type="l", col = "red")
#plot(xt, td$Sub_metering_2, type="l", ylim=ylims,
#     ylab="" , xlab="", col = "red")
#par(new=T)  # as above, keep the plot
points(xt, td$Sub_metering_3, type="l", col = "blue")
#plot(xt, td$Sub_metering_3, type="l", ylim=ylims,
#     ylab="" , xlab="", col = "blue")
legend("topright",  col = c("black", "red", "blue"), lwd=1,
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.copy(png, file = "plot3.png", width=480, height=480 )
dev.off()