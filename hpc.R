# load in hpc data for use by other R modules
# required for Plot1,2,3,4.R
loadhpc <- function(){
    # assumes ./household_power_consumption.txt exists
    
    #load in data file
    dat <- read.table("household_power_consumption.txt",
                      header=TRUE,
                      sep=";",
                      na.strings="?")
    
    # concatenate Date and Time fields into new Time value
    dat$Time <- strptime(paste(dat$Date,dat$Time),"%d/%m/%Y %H:%M:%S")
    # convert Date field to Date format
    dat$Date <- as.Date(dat$Date,"%d/%m/%Y")
    dat
}

if(exists("hpc")==FALSE)
{
    hpc <- loadhpc()
}   