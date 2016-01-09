# Read the entire dataset (this could be done more efficiently)
d <- read.csv( "household_power_consumption.txt", sep=';', na.strings = '?' )

# Clean up the Date type/format
d$Date = as.Date(d$Date,format='%d/%m/%Y')

# Filter down to only the 2 dates we are interested in
d <- d[(d$Date == as.Date('2007-02-01')) | ( d$Date == as.Date('2007-02-02')),]

# Clean up the time type/format
d$Time <- strptime( x=paste(d$Date,d$Time), format="%Y-%m-%d %H:%M:%S", tz="UTC" )
    

# Plot 2
# Line graph of Global_active_power by time

png( "plot2.png", width = 480, height = 480 )
plot(x=d$Time,
     y=d$Global_active_power,
     type="l",
     xlab="",
     ylab="Global Active Power (kilowatts)"
     )
dev.off()