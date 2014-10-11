##The Code loads the dataset
data <- read.table("household_power_consumption.txt",header = TRUE, sep = ";",colClasses = "character")

##The Code convert the Date variable to Date Class
x <- strptime(data[,1], format  = "%d/%m/%Y")  
x <- as.Date(x)
data[,1] <- x

##The Code subsets the Dataset 
data <- subset(data, (data[,1] == ("2007-02-01") | data[,1] == ("2007-02-02")))

##The Code converts the Globale Active Power variable to numeric Class
data[,3] <- as.numeric(data[,3])

##The Code convert the Time variable to POSIXct Class
y <- paste(data[,1],data[,2])
x <- strptime(y, format  = "%Y-%m-%d %H:%M")
x <- as.POSIXct(x)
data[,2] <- x

## The code modify the language for days and months
Sys.setlocale("LC_TIME", "English")

##The Code Makes the Plot
par(mfrow = c(1,1))
plot(data[,2],data[,3], type = "l" , xlab = "",ylab = "Global Active Power (kilowatts)",mar = c(2,2,2,2),cex.lab = 0.7, cex.axis = 0.7)

##The Code saves the Plot in a png file
dev.copy(png, file = "plot2.png", width = 480, height = 480)
dev.off()