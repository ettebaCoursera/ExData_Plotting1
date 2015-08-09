//Read in data and dress up
complete_data <- read.csv("household_power_consumption.txt", header=T, sep=';', na.strings="?",
nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')
head(complete_data, n = 3)

//Subsetting the data by reading in and using dates from 2007-02-01 and 2007-02-02
complete_data$Date <- as.Date(complete_data$Date, format="%d/%m/%Y")

sub_data<- subset(complete_data, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))

head(sub_data)
tail(sub_data)

// Date conversion here
converted_datetime <- paste(as.Date(sub_data$Date), sub_data$Time)
sub_data$Datetime <- as.POSIXct(converted_datetime)


// Plot 3

with(sub_data, {
    plot(Sub_metering_1~Datetime, type="l",
    ylab="Global Active Power (kilowatts)", xlab="")
    lines(Sub_metering_2~Datetime,col='Red')
    lines(Sub_metering_3~Datetime,col='Blue')
})
legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2,
legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

// Saving to file
dev.copy(png, file="plot3.png", height=480, width=480)
dev.off()