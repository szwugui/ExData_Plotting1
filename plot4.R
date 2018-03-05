# download dataset
dataUrl <- 'https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip'
dataFile <- 'dataset.zip'
if (!file.exists(dataFile)) {
    download.file(dataUrl, dataFile, mode = 'wb')
}

# unzip dataset
dataPath <- 'household_power_consumption.txt'
if (!file.exists(dataPath)) {
    unzip(dataFile)
}

# read file
dataset <- read.table(dataPath, header = TRUE, sep=';', quote = '\"',
                      blank.lines.skip = TRUE, fileEncoding = 'UTF-8')
subdata <- dataset[which(dataset$Date=='1/2/2007' | dataset$Date=='2/2/2007'), ]

# write png
png(filename = 'plot4.png', bg = 'transparent', width = 480, height = 480)

par(mfrow=c(2,2))
# plot first picture
plot(c(1:length(subdata$Global_active_power)), as.numeric(as.character(subdata$Global_active_power)), 
     xlab = '', ylab = 'Global Active Power', type = 'l', xaxt = 'n')
axis(side = 1, 
     at = c(0, length(subdata$Global_active_power)/2, length(subdata$Global_active_power)), 
     labels = c('Thu', 'Fri', 'Sat'))

# plot second picture
plot(c(1:length(subdata$Voltage)), as.numeric(as.character(subdata$Voltage)), 
     xlab = 'datetime', ylab = 'Voltage', type = 'l', xaxt = 'n')
axis(side = 1, 
     at = c(0, length(subdata$Voltage)/2, length(subdata$Voltage)), 
     labels = c('Thu', 'Fri', 'Sat'))

#plot third picture
plot(c(1:length(subdata$Sub_metering_1)), as.numeric(as.character(subdata$Sub_metering_1)), 
     xlab = '', ylab = 'Energy sub metering', type = 'l', xaxt = 'n', col = 'black')
lines(c(1:length(subdata$Sub_metering_2)), as.numeric(as.character(subdata$Sub_metering_2)), 
      col = 'red')
lines(c(1:length(subdata$Sub_metering_3)), as.numeric(as.character(subdata$Sub_metering_3)), 
      col = 'blue')
legend('topright', c('Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3'),
       col = c('black', 'red', 'blue'), lty = c(1, 1, 1))
axis(side = 1, 
     at = c(0, length(subdata$Sub_metering_1)/2, length(subdata$Sub_metering_1)), 
     labels = c('Thu', 'Fri', 'Sat'))

#plot fourth picture
plot(c(1:length(subdata$Global_reactive_power)), as.numeric(as.character(subdata$Global_reactive_power)), 
     xlab = 'datetime', ylab = 'Global_reactive_power', type = 'l', xaxt = 'n')
axis(side = 1, 
     at = c(0, length(subdata$Global_reactive_power)/2, length(subdata$Global_reactive_power)), 
     labels = c('Thu', 'Fri', 'Sat'))
dev.off()