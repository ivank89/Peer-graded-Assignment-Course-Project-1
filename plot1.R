## loading the right packages
library(lubridate)
install.packages("data.table")
library(data.table)
library(dplyr)

##setting my directory
setwd('C:/Users/Tommy/Documents/John Hopkins school/Exploratory data In R/Homework') 

##loading the data 
loc.url <- 'https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip'
tf <- 'C:/Users/Tommy/Documents/John Hopkins school/Exploratory data In R/Homework/assignment.zip'
download.file(loc.url, tf) ##dowloading the file
assignment_data <- unzip(tf, list=TRUE)$Name[1] ##read all the files in the zip folder 
unzip(tf, files=assignment_data,
      exdir='C:/Users/Tommy/Documents/John Hopkins school/Exploratory data In R/Homework', overwrite=TRUE)

electric_consumption_data <-read.table(unzip(tf, list=TRUE)$Name[1], header = TRUE, sep = ";", stringsAsFactors=FALSE)


## transforming the date and time into appropriate classes
electric_consumption_data$Date <-as.Date(electric_consumption_data$Date, format = "%d/%m/%Y")
electric_consumption_data$Date_time <- paste(electric_consumption_data$Date,electric_consumption_data$Time )
electric_consumption_data$Date_time <- strptime(electric_consumption_data$Date_time,format = '%Y-%m-%d %H:%M:%S')



##plot 1
##Subsetting the data between the dates 2007-02-01 and 2007-02-02
electric_consumption_data1 <-subset(electric_consumption_data, Date >= as.Date("2007-02-01") & Date <= as.Date('2007-02-02')) 
electric_consumption_data1 <- electric_consumption_data1[, c(10,3,4,5,6,7,8,9)]
electric_consumption_data1 <- na.omit(electric_consumption_data1)

##creating the png file
png( filename = "plot1.png")

##creating the graph
electric_consumption_data1$Global_active_power <- as.numeric(electric_consumption_data1$Global_active_power)
hist(as.numeric(electric_consumption_data1$Global_active_power), col = 'red', main= 'Global Active Power',xlab = "Global Active Power(kilowatts)",
     xlim= c(0, 6),breaks = 12, ylim=c(0,1200), las= 1, xaxt="n") 
axis(1, at=seq(0, 7, by=2), labels=c(0,2,4,6))


##Saving the file
dev.off()
