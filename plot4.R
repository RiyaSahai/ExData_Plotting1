download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", destfile = "./household_power_consumption.txt")
data <- read.csv("household_power_consumption.txt", sep = ";", header = TRUE)
dim(data)

df <- subset(data, Date == "1/2/2007"|Date == "2/2/2007")           #data subsetted for only 1st feb and 2nd feb 2007
df$Global_active_power <- as.numeric(df$Global_active_power) 
df$Date <- as.Date(df$Date, tryFormats = "%d/%m/%Y")

df$Time <- strptime(df$Time, format = "%H:%M:%S")
df[1:1440, "Time"] <- format(df[1:1440,"Time"],"2007-02-01 %H:%M:%S")
df[1441:2880, "Time"] <- format(df[1441:2880,"Time"],"2007-02-02 %H:%M:%S")
df$final <- strptime(df$Time, format = "%Y-%m-%d %H:%M:%S")

par(mfcol=c(2,2), mar = c(4,4,4,4))
plot(df$final, df$Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")
plot(df$final, df$Sub_metering_1, col = "black", type = "l", xlab = "", ylab = "Energy sub metering")
lines(df$final, df$Sub_metering_3, col="blue")
lines(df$final, df$Sub_metering_2, col = "red")
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col = c("black", "blue", "red"), pch = 19)

plot(df$final, df$Voltage, type = "l", xlab ="datetime", ylab = "Voltage")
plot(df$final, df$Global_reactive_power, type="l", xlab="", ylab="Global Active Power (kilowatts)", ylim = c(0.0,0.5))

dev.cur()
dev.copy(png, file = "plot4.png")
dev.off()
