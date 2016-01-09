# Read the entire dataset (this could be done more efficiently)
d <- read.csv( "household_power_consumption.txt", sep=';', na.strings = '?' )

# Clean up the Date type/format
d$Date = as.Date(d$Date,format='%d/%m/%Y')

# Filter down to only the 2 dates we are interested in
d <- d[(d$Date == as.Date('2007-02-01')) | ( d$Date == as.Date('2007-02-02')),]

# Clean up the time type/format
d$Time <- strptime( x=paste(d$Date,d$Time), format="%Y-%m-%d %H:%M:%S", tz="UTC" )


# Plot 4
# Multiple graphs in a 2x2 grid

png( "plot4.png", width = 480, height = 480 )
par(mfcol=c(2,2))

# topleft: line graph of Global_active_power by time

plot(x=d$Time,
     y=d$Global_active_power,
     type="l",
     xlab="",
     ylab="Global Active Power"
)

# bottomleft: multi-line graph of each Sub_metering by time

plot( x=d$Time, y=d$Sub_metering_1, type="l", ylab="Energy sub metering", xlab="" )
points( x=d$Time, y=d$Sub_metering_2, col="red", type="l" )
points( x=d$Time, y=d$Sub_metering_3, col="blue", type="l" )
legend( x = "topright",
        legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
        lty = 1,
        col = c("black","red","blue"),
        bty = "n"
)

# topright: line graph of Voltage by time

plot( x = d$Time, y = d$Voltage, type = "l", ylab = "Voltage", xlab = "datetime" )

# bottomright: line graph of Global_reactive_power by time
plot( x = d$Time,
      y = d$Global_reactive_power,
      type = "l",
      ylab = "Global_reactive_power",
      xlab = "datetime" )

dev.off()