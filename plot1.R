
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
png(filename = 'plot1.png', bg = 'transparent', width = 480, height = 480)
hist(as.numeric(as.character(subdata$Global_active_power)), main = 'Global Active Power',
     xlab = 'Global Active Power(kilowatts)', ylab = 'Frequency', col = 'red',
     )
dev.off()