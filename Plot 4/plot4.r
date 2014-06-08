## The basic assumption here is that the file "household_power_consumption.txt" is present in your working directory
##after being extracted from the zip file. The plot is obtained using a 2 step process as shown below


# Step 1-Reading and Processing the data to get it in the required format
data<- read.table("household_power_consumption.txt", header= T, sep=";", na.strings = "?",stringsAsFactors= F)
## Converting date column to Date class
data$Date<- as.Date(data$Date, format= " %d/%m/%Y")
##Subsetting based on the given dates
data<- data[(data$Date == "2007-02-01")|(data$Date == "2007-02-02"),]

## Creating a 10th column named"DateTime" with both date and time combined. The data type for this column by default
##will become character.
data$DateTime<-paste(data$Date, data$Time)

## Changing the data class of  column 10 to POSIXlt
data$DateTime<- strptime(data$DateTime, format="%Y-%m-%d %H:%M:%S")

# Step 2-PLotting the data
png("plot4.png", width = 480, height = 480)
par(mfcol=c(2,2))
## Plot1
plot(data$DateTime,data$Global_active_power,type="l",ylab="Global Active Power", xlab="")
#Plot2
plot(data$DateTime,data$Sub_metering_1,type="l",ylab="Energy sub metering", xlab="")
lines(data$DateTime,data$Sub_metering_2,col="red")
lines(data$DateTime,data$Sub_metering_3,col="blue")
legend("topright", legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), col= c("black","red", "blue"),lwd =1, bty="n",pt.cex=1,cex=0.9)
##Plot3
plot(data$DateTime,data$Voltage,type="l",ylab="Voltage", xlab="datetime")
##Plot4
plot(data$DateTime,data$Global_reactive_power,type="l",ylab="Global_reactive_power", xlab="datetime")
dev.off()