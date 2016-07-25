# Script that produce plot3.png

# Start sourcing the lightweight hpc dataset
source("./load_data.R")

png(filename = "plot3.png",height = 480,width=480)

plot(hpc$Date,hpc$Global_active_power, 
     xlab = "",
     ylab ="Energy sub metering", 
     ylim = c(-2,40),
     type = "n")
cols=c("black","red","blue")
legends<-c()
for(i in 1:3){
        legends[i]=paste("Sub_metering_",i,sep = "")
        lines(hpc$Date,hpc[,legends[i]],type="l",col=cols[i])
}
legend("topright",col = cols,legend = legends)

dev.off()
