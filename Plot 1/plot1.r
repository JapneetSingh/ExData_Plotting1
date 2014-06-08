

## The basic assumption here is that the file "household_power_consumption.txt" is present in your working directory
##after being extracted from the zip file. The plot is obtained using a 2 step process as shown below


# Step 1-Reading and Processing the data to get it in the required format
data<- read.table("household_power_consumption.txt", header= T, sep=";", na.strings = "?",stringsAsFactors= F)
## Converting date column to Date class
data$Date<- as.Date(data$Date, format= " %d/%m/%Y")
##Subsetting based on the given dates
data<- data[(data$Date == "2007-02-01")|(data$Date == "2007-02-02"),]


# Step 2-PLotting the data 
png("plot1.png", width = 480, height = 480)
plot1<- hist(data$Global_active_power,col="red", xlab="Global Active Power(kilowatts)", main = "Global Active Power")
dev.off()








