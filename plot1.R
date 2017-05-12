setwd("C:/Users/Anurag_gupta11/Desktop/Secondary work stack/Data science/Coursera/Exploratory Data Analysis/Week 1")
houseDF <- read.table("household_power_consumption.txt",header = TRUE,sep = ";")

houseDF$Date <- strptime(format(houseDF$Date),"%d/%m/%Y")

su <- houseDF[houseDF$Date == "2007-02-01" | houseDF$Date == "2007-02-02",] 

remove(houseDF)
su$Global_active_power <- as.numeric(as.character(su$Global_active_power))

png(filename = "plot1.png",width = 480, height = 480)
with(su,hist(Global_active_power, col="red", xlab = "Global Active Power(kilowatts)",main = "Global Active Power"))
dev.off()
  