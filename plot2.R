#Plot 2 - run plot2()

#load hpc dataset into hpc variable
source("./hpc.R")

gap_time_plot <- function() {

    
   
    
    # plot empty plot of 2007-02-01 -> 2007-02-02 subset of data
    with(subset(hpc,
                hpc$Date >= "2007-02-01" &  hpc$Date <= "2007-02-02"),
         plot(Time,Global_active_power,type="n",ylab="Global active power (killowatts)",xlab="", cex.lab=0.75,
              cex.main=0.9,
              cex.sub=0.75,
              cex.axis=0.75))
    
    # add line for Global Active Power over time
    with(subset(hpc,
                hpc$Date >= "2007-02-01" &  hpc$Date <= "2007-02-02"),lines(Time,Global_active_power))
}
plot2 <- function(){
    #set background graphic parameter to transparent
    par(bg="transparent",mfrow=c(1,1))
    
    gap_time_plot()

    # save plot to ./plot2.png
    dev.copy(png, file = "plot2.png",bg="transparent",
             width=480,height=480,units="px")
    dev.off()
}
#plot2()