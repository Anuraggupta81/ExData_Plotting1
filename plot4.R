setwd("C:/Users/Anurag_gupta11/Desktop/Secondary work stack/Data science/Coursera/Exploratory Data Analysis/Week 1")
houseDF <- read.table("household_power_consumption.txt",header = TRUE,sep = ";")

subsetDF <- houseDF[houseDF$Date %in% c("1/2/2007","2/2/2007"),]
remove(houseDF)

gl <- as.numeric(subsetDF$Global_active_power)
datetime <- strptime(paste(subsetDF$Date, subsetDF$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 

SubM1 <- as.numeric(subsetDF$Sub_metering_1)
SubM2 <- as.numeric(subsetDF$Sub_metering_2)
SubM3 <- as.numeric(subsetDF$Sub_metering_3)

volt <- as.numeric(as.character(subsetDF$Voltage))
glr <- as.numeric(as.character(subsetDF$Global_reactive_power))



png(filename = "Plot4.png", width = 480, height = 480)
par(mfrow = c(2,2))
#Graph 1
  plot(datetime,gl, ylab = "Global Active Power",xlab = "", type = "l")
#Graph 2
  plot(datetime, volt, ylab = "Voltage", xlab = "datetime", type = "l")
#Graph 3
  plot(datetime, SubM1, type="l",ylab = "Energy sub metering",xlab = "")
  lines(datetime, SubM2, type="l",col="red")
  lines(datetime, SubM3, type="l",col="blue")
  legend("topright", col=c("black","blue", "red"),lty = 1, lwd=2,  legend=c("Sub Metering 1","Sub Metering 2","Sub Metering 3"))
#Graph 4
  plot(datetime, glr, type="l",ylab = "Global_reactive_power",xlab = "datetime")
dev.off()
