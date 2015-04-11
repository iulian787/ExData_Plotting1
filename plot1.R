# read the data, put in a data frame
# we read only 100000 lines, because we know what 
dafr = read.table(file="../household_power_consumption.txt",
      na.strings="?", sep=";", header=TRUE, nrows=100000 )
# convert to Date , so it will be easier to compare dates
dafr$Date = as.Date(dafr$Date, "%d/%m/%Y")
# extract subset of interest, Feb 1-2, 2007
twodays = dafr[ (dafr$Date>="2007-02-01" ) & (dafr$Date <="2007-02-02"),]
hist(twodays$Global_active_power, main="Global Active Power",
     xlab="Global Active Power(kilowatts)", col="red")
# copy the result to png file, default sizes specified, just to be sure
dev.copy(png, file = "plot1.png", width=480, height=480 )
dev.off()