#Plot 1

#load hpc dataset into hpc variable
source("./hpc.R")

gap_hist <- function(){

   
    #set background graphic parameter to transparent
    par(bg="transparent")
    
    # plot histogram of 2007-02-01 -> 2007-02-02 subset of data
    hist(subset(hpc$Global_active_power,
                hpc$Date >= "2007-02-01" & hpc$Date <="2007-02-02"),
                main="Global Active Power",
                xlab="Global Active Power (kilowatts)",
                col="red", 
            cex.lab=0.75,
         cex.main=0.9,
         cex.sub=0.75,
         cex.axis=0.75,font=1,family="sans")
}

plot1 <- function(){
    gap_hist()
    
    # save plot to ./plot1.png
    dev.copy(png, file = "plot1.png",bg="transparent")
    dev.off()
}

#plot1()