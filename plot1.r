        filename <- "household_power_consumption.txt"
        filepath <- "../../../../../Downloads"  ## I left the file in my downloads directory, because all my datascience projects are backed up into the cloud, so I just wand to save on bandwidth

        fullData <- read.csv(paste0(filepath, "/", filename), sep = ";", na.strings = "?", stringsAsFactors = FALSE, dec=".")

        data <- subset(fullData, Date == "1/2/2007" | Date == "2/2/2007")

        data$dateTime<- strptime(paste(data$Date, data$Time), "%d/%m/%Y %H:%M:%S")


        

        data$Global_active_power <- as.numeric(data$Global_active_power)

        png("plot1.png", width=480, height=480)
        
        hist(data$Global_active_power, col ="red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")
        
        dev.off()