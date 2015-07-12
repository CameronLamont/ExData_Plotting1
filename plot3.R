#Plot 3

#load hpc dataset into hpc variable
source("./hpc.R")

esb_time_plot <- function(legend_bty="o"){
    #set background graphic parameter to transparent
    par(bg="transparent")
    
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
    legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
           col=c("black","red","blue"),lty=1,cex=0.75,text.width=50000,bty=legend_bty)
}

plot3 <- function(){
    esb_time_plot()
    # save plot to ./plot3.png
    dev.copy(png, file = "plot3.png",bg="transparent")
    dev.off()
}
#plot3()