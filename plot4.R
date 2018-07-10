#load the file
 electric_consumption_data <-read.table(unzip(tf, list=TRUE)$Name[1], header = TRUE, sep = ";", stringsAsFactors=FALSE)
 
 
 ##Subsetting the data between the dates 2007-02-01 and 2007-02-02
 electric_consumption_data1 <-subset(electric_consumption_data, Date >= as.Date("2007-02-01") & Date <= as.Date('2007-02-02')) 
 electric_consumption_data1 <- electric_consumption_data1[, c(10,3,4,5,6,7,8,9)]
 electric_consumption_data1 <- na.omit(electric_consumption_data1)
 
 
 ##creating the png file
 png( filename = "plot4.png")
 
 ##preparing the spaces for the 4 graphs 2 by 2
 par(mfrow=c(2,2),  mar = c(4, 4, 2, 1), oma = c(0, 0, 2, 0)) 
 
##first graph
 with( electric_consumption_data1,
       plot(Date_time,
            as.numeric(Global_active_power),
            xaxt="n",
            ylab="Global Active Power(kilowatts)", 
            ylim = c(0,7),  type="l", 
            xlab= '')) ##removing the axis label, and the axis title
 
 axis.POSIXct(1, at=seq(daterange[1], daterange[2], by="day"), format="%d", labels=c('Thu','Fri','Sat')) ##plotting the axis by day
 
 
 ## Second graph
 with( electric_consumption_data1,
       plot(Date_time,
            as.numeric(Voltage),
            xaxt="n", 
            ylim = c(230,250),
            yaxt= 'n',
            type="l",
            xlab = 'voltage'
            )) ##removing the axis label, and the axis title
 
 axis.POSIXct(1, at=seq(daterange[1], daterange[2], by="day"), format="%d", labels=c('Thu','Fri','Sat')) ##plotting the axis by day
 axis(2, at=seq(234, 246, by=4), labels=c(234,238,242,246))
 
 ###third graph
 with( electric_consumption_data1,
       plot(Date_time,
            as.numeric(Sub_metering_1),
            xaxt="n",
            ylab="Energy sub metering", 
            ylim = c(0,40),  type="l", 
            xlab= '')) ##removing the axis label, and the axis title
 
 
 axis.POSIXct(1, at=seq(daterange[1], daterange[2], by="day"), format="%d", labels=c('Thu','Fri','Sat')) ##plotting the axis by day
 
 # Add second curve to the same plot by calling points()
 points(electric_consumption_data1$Date_time, 
        electric_consumption_data1$Sub_metering_2, col="red", type="l")
 
 # Add Third curve to the same plot by calling points()
 points(electric_consumption_data1$Date_time, 
        electric_consumption_data1$Sub_metering_3, col="blue", type="l")
 
 # Adding a legend inside box 
 legend("topright",
        legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), 
        col=c("black","red","blue"),
        lty=c(1,1,1),
        ncol= 1,
        cex = 0.0 ##size
 )
 
 ##fourth graph
 with( electric_consumption_data1,
       plot(Date_time,
            as.numeric(Global_reactive_power),
            xaxt="n",
            ylab="Global_reactive_power", 
            ylim = c(0.0,0.50),
            yaxt= 'n',
            type="l" 
       )) ##removing the axis label, and the axis title
 
 axis.POSIXct(1, at=seq(daterange[1], daterange[2], by="day"), format="%d", labels=c('Thu','Fri','Sat')) ##plotting the axis by day
 axis(2, at=seq(0.0, 0.60, by=0.1), labels=c(0.0,0.1,0.2,0.3,0.4,0.5,0.7))
 
 #closing the device
 dev.off() 
 
