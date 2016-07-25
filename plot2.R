# Script that produce plot2.png

# Start sourcing the lightweight hpc dataset
source("./load_data.R")

png(filename = "plot2.png",height = 480,width=480)

plot(hpc$Date,hpc$Global_active_power,
     xlab = "",
     ylab ="Global Active Power (kilowatts)",
     type = "n")
lines(hpc$Date,hpc$Global_active_power,type="l")

dev.off()
