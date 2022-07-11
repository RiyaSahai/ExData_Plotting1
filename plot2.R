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
plot(df$final, df$Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")

dev.cur()
dev.copy(png, file = "plot2.png")
dev.off()