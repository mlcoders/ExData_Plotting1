# Script that produce plot4.png

# Start sourcing the lightweight hpc dataset
source("./load_data.R")

png(filename = "plot4.png",height = 480,width=480)

# Configure the ploting window
par(mfcol=c(2,2)) # draw by column

# 1st plot, topleft    
plot(hpc$Date,hpc$Global_active_power,xlab = "",ylab ="Global Active Power (kilowatts)",type = "n")
lines(hpc$Date,hpc$Global_active_power,type="l")

# 2nd plot, bottom left
plot(hpc$Date,hpc$Global_active_power, 
     xlab = "",
     ylab ="Energy sub metering", 
     ylim = c(-1,37),
     type = "n")
cols=c("black","red","blue")
legends<-c()
for(i in 1:3){
        legends[i]=paste("Sub_metering_",i,sep = "")
        lines(hpc$Date,hpc[,legends[i]],type="l",col=cols[i])
}
legend("topright",
       col = cols,
       legend = legends,
       lty=1,
       bty="n")

# 3rd plot, top right
plot(hpc$Date,
     hpc$Voltage,
     xlab = "datetime",
     ylab = "Voltage",
     type = "n")
with(hpc,lines(Date,Voltage,type="l"))

# 4th plot, bottom right
plot(hpc$Date,
     hpc$Global_reactive_power,
     xlab = "datetime",
     ylab = "Global_reactive_power",
     type = "n")
with(hpc,lines(Date,Global_reactive_power,type="l"))


dev.off()
