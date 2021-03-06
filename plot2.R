dafr = read.table(file="../household_power_consumption.txt", na.strings="?", sep=";", header=TRUE, nrows=100000 )
dafr$Date = as.Date(dafr$Date, "%d/%m/%Y")
twodays = dafr[ (dafr$Date>="2007-02-01" ) & (dafr$Date <="2007-02-02") ,]
# extract first 2 columns, to process later the time variable
dd=twodays$Date
tt=twodays$Time
xt=paste(dd, tt) # form one variable, now a character
# convert to POSIX time, can be used directly in plot, will produce 
# the right marks (Thu, Fri, Sat) on time axis
xt = strptime(xt, "%Y-%m-%d %H:%M:%S")
plot(xt, twodays$Global_active_power, type="l", 
     ylab="Global Active Power (kilowatts)" , xlab="")
dev.copy(png, file = "plot2.png", width=480, height=480 )
dev.off()