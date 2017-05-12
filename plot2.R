setwd("C:/Users/Anurag_gupta11/Desktop/Secondary work stack/Data science/Coursera/Exploratory Data Analysis/Week 1")
houseDF <- read.table("household_power_consumption.txt",header = TRUE,sep = ";")

subsetDF <- houseDF[houseDF$Date %in% c("1/2/2007","2/2/2007"),]
remove(houseDF)

gl <- as.numeric(subsetDF$Global_active_power)
datetime <- strptime(paste(subsetDF$Date, subsetDF$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 

png("plot2.png", width=480, height=480)
plot(datetime, gl, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()

