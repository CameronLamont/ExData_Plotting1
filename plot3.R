#Plot 3

#load hpc dataset into hpc variable
source("./hpc.R")

#allow for legend border to be disabled with legend.bty="n"
#adjust legend text width to correct for PNG output
esb_time_plot <- function(legend.bty="o",legend.text.width=40000){
    
    # plot empty plot of 2007-02-01 -> 2007-02-02 subset of data
    with(subset(hpc,
                hpc$Date >= "2007-02-01" &  hpc$Date <= "2007-02-02"),
         plot(Time,Sub_metering_1,type="n",ylab="Energy sub metering",xlab="", 
              cex.lab=0.75,
              cex.main=0.9,
              cex.sub=0.75,
              cex.axis=0.75))
    
    # add line for each sub metering measurement over time
    with(subset(hpc,
                hpc$Date >= "2007-02-01" &  hpc$Date <= "2007-02-02"),
                lines(Time,Sub_metering_1,col="black"))
    with(subset(hpc,
                hpc$Date >= "2007-02-01" &  hpc$Date <= "2007-02-02"),
                lines(Time,Sub_metering_2,col="red"))
    with(subset(hpc,
                hpc$Date >= "2007-02-01" &  hpc$Date <= "2007-02-02"),
                lines(Time,Sub_metering_3,col="blue"))
    
    #add legend
    legend("topright",
           legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
           col=c("black","red","blue"),lty=1,cex=0.70,bty=legend.bty,
           inset=c(0.001,0.001),text.width=legend.text.width,y.intersp=1.2)
}

plot3 <- function(){
    
    #set background graphic parameter to transparent
    par(bg="transparent",mfrow=c(1,1))
    
    esb_time_plot(legend.bty="o",legend.text.width=40000)
    # save plot to ./plot3.png
    dev.copy(png, file = "plot3.png",bg="transparent",
             width=480,height=480,units="px")
    dev.off()
}
#plot3()