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
png(filename = 'plot2.png', bg = 'transparent', width = 480, height = 480)
plot(c(1:length(subdata$Global_active_power)), as.numeric(as.character(subdata$Global_active_power)), 
     xlab = '', ylab = 'Global Active Power(kilowatts)', type = 'l', xaxt = 'n')
axis(side = 1, 
     at = c(0, length(subdata$Global_active_power)/2, length(subdata$Global_active_power)), 
     labels = c('Thu', 'Fri', 'Sat'))
dev.off()