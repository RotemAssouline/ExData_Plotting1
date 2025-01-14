## plot3

# read the data
  
  hpc <- read.table(unz('exdata_data_household_power_consumption.zip','household_power_consumption.txt'),
                  sep = ';',header = TRUE, dec = '.', na.strings = '?',
                  colClasses = c(rep('character',2),rep('numeric',7)))
  hpc <- hpc[hpc$Date %in% c('1/2/2007','2/2/2007'),]
  DateTime <- strptime(paste(hpc$Date,hpc$Time),format = '%d/%m/%Y %H:%M:%S')
  hpc <- cbind(DateTime,hpc[,c(-1,-2)])

# create plot
  
  png('plot3.png')
  
  plot(hpc$DateTime,hpc$Sub_metering_1,type = 'l',xlab = '',ylab = 'Energy sub metering', xaxt = 'n' )
  lines(hpc$DateTime,hpc$Sub_metering_2,col = 'red')
  lines(hpc$DateTime,hpc$Sub_metering_3,col = 'blue')
  legend('topright',c('Sub_metering_1','Sub_metering_2','Sub_metering_3'),col = c('black','red','blue'),pch=20)
  axis.POSIXct(1, at=as.Date(hpc$DateTime),labels = format(hpc$DateTime,'%a'))
  
  dev.off()