#Plot 3

#load hpc dataset into hpc variable
source("./hpc.R")

esb_plot <- function(){
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
           col=c("black","red","blue"),lty=1,cex=0.75,text.width=50000)
}



volt_time_plot <- function() {
    
    
    #set background graphic parameter to transparent
    par(bg="transparent")
    
    # plot empty plot of 2007-02-01 -> 2007-02-02 subset of data
    with(subset(hpc,
                hpc$Date >= "2007-02-01" &  hpc$Date <= "2007-02-02"),
         plot(Time,Voltage,type="n",ylab="Voltage",xlab="datetime", cex.lab=0.75,
              cex.main=0.9,
              cex.sub=0.75,
              cex.axis=0.75))
    
    # add line for Voltage over time
    with(subset(hpc,
                hpc$Date >= "2007-02-01" &  hpc$Date <= "2007-02-02"),lines(Time,Voltage))
}
grp_time_plot <- function() {
    
    
   
    
    # plot empty plot of 2007-02-01 -> 2007-02-02 subset of data
    with(subset(hpc,
                hpc$Date >= "2007-02-01" &  hpc$Date <= "2007-02-02"),
         plot(Time,Global_reactive_power,type="n",ylab="Global_reactive_power",xlab="datetime", cex.lab=0.75,
              cex.main=0.9,
              cex.sub=0.75,
              cex.axis=0.75))
    
    # add line for Global Re-Active Power over time
    with(subset(hpc,
                hpc$Date >= "2007-02-01" &  hpc$Date <= "2007-02-02"),lines(Time,Global_reactive_power))
}


plot4 <- function(){
    #import functions from plot2 and 3 for first 2 plots (column-wise)
    source("./plot2.R")
    source("./plot3.R")
    
    #set background graphic parameter to transparent
    #set mfcol parameter to column wise 2x2
    par(bg="transparent",mfcol = c(2,2))
    

    #plot 2 - top left
    gap_time_plot()
    #plot 3 - bottom left - no legend border, 
    #override default legend with for png output
    esb_time_plot(legend.bty="n",legend.text.width=80000)
    # new for plot4 top right and bottom right
    volt_time_plot()
    grp_time_plot()
    
    
    # save plot to ./plot4.png
    dev.copy(png, file = "plot4.png",bg="transparent",
             width=480,height=480,units="px")
    dev.off()
}
plot4()