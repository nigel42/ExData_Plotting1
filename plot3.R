# Read the entire dataset (this could be done more efficiently)
d <- read.csv( "household_power_consumption.txt", sep=';', na.strings = '?' )

# Clean up the Date type/format
d$Date = as.Date(d$Date,format='%d/%m/%Y')

# Filter down to only the 2 dates we are interested in
d <- d[(d$Date == as.Date('2007-02-01')) | ( d$Date == as.Date('2007-02-02')),]

# Clean up the time type/format
d$Time <- strptime( x=paste(d$Date,d$Time), format="%Y-%m-%d %H:%M:%S", tz="UTC" )
    

# Plot 3
# Multi-line graph of each Sub_metering by time

png( "plot3.png", width = 480, height = 480, bg = "transparent" )
plot( x=d$Time, y=d$Sub_metering_1, type="l", ylab="Energy sub metering", xlab="" )
points( x=d$Time, y=d$Sub_metering_2, col="red", type="l" )
points( x=d$Time, y=d$Sub_metering_3, col="blue", type="l" )
legend( x = "topright",
        legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
        lty = 1,
        col = c("black","red","blue")
        )
dev.off()