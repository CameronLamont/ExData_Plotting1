#Plot 2
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


# save plot to ./plot2.png
dev.copy(png, file = "plot2.png",bg="transparent")
dev.off()