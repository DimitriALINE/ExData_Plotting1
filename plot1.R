##The Code loads the dataset
data <- read.table("household_power_consumption.txt",header = TRUE, sep = ";",colClasses = "character")

##The Code converts the Date variable to Date Class
x <- strptime(data[,1], format  = "%d/%m/%Y")  
x <- as.Date(x)
data[,1] <- x

##The Code subsets the Dataset 
data <- subset(data, (data[,1] == ("2007-02-01") | data[,1] == ("2007-02-02")))

##The Code converts the Globale Active Power variable to numeric Class
data[,3] <- as.numeric(data[,3])

##The Code Makes the Histogram
par(mfrow = c(1,1))
hist(data[,3], col = "red", xlab = "Global Active Power (kilowatts)", xaxp = c(0,6,3),
     ylim = c(0,1200), breaks = 12, main = "Global Active Power", mar = c(2,2,2,2), cex.lab = 0.7, cex.axis = 0.7, cex.main = 0.8)

##The Code saves the Histogram in a png file
dev.copy(png, file = "plot1.png", width = 480, height = 480)
dev.off()