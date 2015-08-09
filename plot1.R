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

//plot histogram
hist( sub_data$Global_active_power, main="Global Active Power",xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red")

// Saving to file
dev.copy(png, file="plot1.png", height=480, width=480)
dev.off()