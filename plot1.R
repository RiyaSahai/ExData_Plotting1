
data <- read.csv("household_power_consumption.txt", sep = ";", header = TRUE)
dim(data)

df <- subset(data, Date == "1/2/2007"|Date == "2/2/2007")           #data subsetted for only 1st feb and 2nd feb 2007
df$Global_active_power <- as.numeric(df$Global_active_power)        #converted for the creation of histogram
hist(df$Global_active_power, col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)", ylab = "Frequency")

dev.cur()
dev.copy(png, file = "plot1.png")
dev.off()
