# Script that produce plot1.png

# Start sourcing the lightweight hpc dataset
source("./load_data.R")

png(filename = "plot1.png",height = 480,width=480)

hist(hpc$Global_active_power,
     col = "red",
     main = "Global Active Power",
     xlab = "Global Active Power (kilowatts)")

dev.off()
