#Read in the file and the process it to ensure that the date and time
#are in the right format POSIXct in this case
hpc <- read.csv("~/Documents/workspace/R/household_power_consumption.txt", sep=";", na.strings="?", stringsAsFactors=FALSE)

#Here we make sure that the Time field has the correct date/time combination by
#combining the first and second fields
hpc$Time<-paste(hpc$Date, hpc$Time)
hpc$Date<-as.POSIXct(hpc$Date, format='%d/%m/%Y')
hpc$Time<-as.POSIXct(hpc$Time, format='%d/%m/%Y %T')

#Now set the date range and subset
startDate<-as.POSIXct("2007-02-02")
endDate<-as.POSIXct("2007-02-01")
hpcd<-subset(hpc, Date >=startDate & Date <=endDate)

#create the png device. and plot.
png(file="Plot1.png", bg="transparent", width=480, height=480 )
hist(hpcd$Global_active_power, main="Global Active Power", xlab="Global Active Power (kilowatts)", ylab="Frequency", col="red")
dev.off()

#hist(hpcd$Global_active_power, main="Global Active Power", xlab="Global Active Power (kilowatts)", ylab="Frequency", col="red")
#hpc <- read.csv("~/Documents/workspace/R/hpc.csv", sep=";", na.strings="?", stringsAsFactors=FALSE)