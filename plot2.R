## plot2

# read the data

  hpc <- read.table('household_power_consumption.txt',sep = ';',header = TRUE, dec = '.', na.strings = '?', colClasses = c(rep('character',2),rep('numeric',7)))
  hpc <- hpc[hpc$Date %in% c('1/2/2007','2/2/2007'),]
  DateTime <- strptime(paste(hpc$Date,hpc$Time),format = '%d/%m/%Y %H:%M:%S')
  hpc <- cbind(DateTime,hpc[,c(-1,-2)])

# create plot
  
  png('plot2.png')
  
  plot(hpc$DateTime,hpc$Global_active_power,type = 'l',xlab='',xaxt ='n',ylab = 'Global Active Power (killowatts)')
  axis.POSIXct(1, at=as.Date(hpc$DateTime),labels = format(hpc$DateTime,'%a'))
  
  dev.off()