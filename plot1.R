## plot1

# read the data

  hpc <- read.table(unz('exdata_data_household_power_consumption.zip','household_power_consumption.txt'),
                    sep = ';',header = TRUE, dec = '.', na.strings = '?',
                    colClasses = c(rep('character',2),rep('numeric',7)))
  hpc <- hpc[hpc$Date %in% c('1/2/2007','2/2/2007'),]
  DateTime <- strptime(paste(hpc$Date,hpc$Time),format = '%d/%m/%Y %H:%M:%S')
  hpc <- cbind(DateTime,hpc[,c(-1,-2)])

# create plot
    
  png('plot1.png')
  
  hist(hpc$Global_active_power, col='red',xlab = 'Global Active Power (killowatts)',main = 'Global Active Power')
  
  dev.off()