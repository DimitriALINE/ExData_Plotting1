##The Code loads the dataset
data <- read.table("household_power_consumption.txt",header = TRUE, sep = ";",colClasses = "character")

##The Code convert the Date variable to Date Class
x <- strptime(data[,1], format  = "%d/%m/%Y")  
x <- as.Date(x)
data[,1] <- x

##The Code subsets the Dataset 
data <- subset(data, (data[,1] == ("2007-02-01") | data[,1] == ("2007-02-02")))

##The Code converts the Energy sub metering variables to numeric Class
data[,7] <- as.numeric(data[,7])
data[,8] <- as.numeric(data[,8])
data[,9] <- as.numeric(data[,9])

##The Code convert the Time variable to POSIXct Class
y <- paste(data[,1],data[,2])
x <- strptime(y, format  = "%Y-%m-%d %H:%M")
x <- as.POSIXct(x)
data[,2] <- x

## The code modify the language for days and months
Sys.setlocale("LC_TIME", "English")

##The Code saves the Plot in a png file
png( file = "plot3.png" ,width = 480, height = 480)

##The Code Makes the Plot
par(mfrow = c(1,1))
with(data,plot(data[,2],data[,7],type = "n", yaxp = c(0,30,3), xlab = "",ylab = "Energy sub metering",mar = c(2,2,2,2),cex.lab = 0.8, cex.axis = 0.8))
with(data, points(data[,2],data[,7], type = "l"))
with(data, points(data[,2],data[,8], type = "l", col = "red"))
with(data, points(data[,2],data[,9], type = "l", col = "blue"))
##The Code Makes the Legend
legend("topright",lty = 1, cex = 0.8, col = c("black", "red","blue"),legend = c(" Sub_metering_1 "," Sub_metering_2 "," Sub_metering_3 "))
dev.off()