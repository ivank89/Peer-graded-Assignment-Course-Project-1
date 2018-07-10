##plot 2

##creating the png file
png( filename = "plot2.png")

##Load the file
electric_consumption_data <-read.table(unzip(tf, list=TRUE)$Name[1], header = TRUE, sep = ";", stringsAsFactors=FALSE)

##Subsetting the data between the dates 2007-02-01 and 2007-02-02
electric_consumption_data1 <-subset(electric_consumption_data, Date >= as.Date("2007-02-01") & Date <= as.Date('2007-02-02')) 
electric_consumption_data1 <- electric_consumption_data1[, c(10,3,4,5,6,7,8,9)]
electric_consumption_data1 <- na.omit(electric_consumption_data1)
## figure out the lowest and highest days
daterange=c(as.POSIXlt(min(electric_consumption_data1$Date_time)),as.POSIXlt(max(electric_consumption_data1$Date_time)))

##plotting the line graph
with( electric_consumption_data1,
      plot(Date_time,
           as.numeric(Global_active_power),
           xaxt="n",
           ylab="Global Active Power(kilowatts)", 
           ylim = c(0,7),  type="l", 
           xlab= '')) ##removing the axis label, and the axis title

axis.POSIXct(1, at=seq(daterange[1], daterange[2], by="day"), format="%d", labels=c('Thu','Fri','Sat')) ##plotting the axis by day

 #closing the device
 dev.off() 
 
