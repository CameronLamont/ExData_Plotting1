#Plot 1
# assumes ./household_power_consumption.txt exists

#load in data file
hpc <- read.table("household_power_consumption.txt",
               header=TRUE,
               sep=";",
               na.strings="?")

# concatenate Date and Time as Time value
hpc$Time <- strptime(paste(hpc$Date,hpc$Time),"%d/%m/%Y %H:%M:%S")
# convert Date to Date format
hpc$Date <- as.Date(hpc$Date,"%d/%m/%Y")

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

# save plot to ./plot1.png
dev.copy(png, file = "plot1.png",bg="transparent")
dev.off()