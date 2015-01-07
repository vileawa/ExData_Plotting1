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
png(file="Plot3.png", bg="transparent", width=480, height=480 )
plot(hpcd$Time, hpcd$Sub_metering_1, type ="l", ylab="Energy sub Metering",xlab="")
lines (hpcd$Sub_metering_2 ~ hpcd$Time, type="l", col="red", xlab="")
lines (hpcd$Sub_metering_3 ~ hpcd$Time, type="l", col="blue", xlab="")
legend("topright",legend=c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"), col=c("black","red","blue"), lty=1)

dev.off()