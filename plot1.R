# Read the entire dataset (this could be done more efficiently)
d <- read.csv( "household_power_consumption.txt", sep=';', na.strings = '?' )

# Clean up the Date type/format
d$Date = as.Date(d$Date,format='%d/%m/%Y')

# Filter down to only the 2 dates we are interested in
d <- d[(d$Date == as.Date('2007-02-01')) | ( d$Date == as.Date('2007-02-02')),]

# Plot 1
# Histogram of Global_active_power

png( "plot1.png", width = 480, height = 480, bg = "transparent" )
hist( d$Global_active_power,
     col = "red",
     main = "Global Active Power",
     xlab = "Global Active Power (kilowatts)"
     )
dev.off()