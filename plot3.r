
        filename <- "household_power_consumption.txt"
        filepath <- "../../../../../Downloads"  ## I left the file in my downloads directory, because all my datascience projects are backed up into the cloud, so I just wand to save on bandwidth

        
        fullData <- read.csv(paste0(filepath, "/", filename), sep = ";", na.strings = "?", stringsAsFactors = FALSE, dec=".")

        data <- subset(fullData, Date == "1/2/2007" | Date == "2/2/2007")

        data$dateTime<- strptime(paste(data$Date, data$Time), "%d/%m/%Y %H:%M:%S")

        data$Global_active_power <- as.numeric(data$Global_active_power)

        png("plot3.png", width=480, height=480)

        plot(data$dateTime, data$Sub_metering_1, type = "l", xlab = "", ylab = "Energy submetering")
        lines(data$dateTime, data$Sub_metering_2, type = "l", col = "red")
        lines(data$dateTime, data$Sub_metering_3, type = "l", col = "blue")
        legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2, col=c("black", "red", "blue"))
        
        dev.off()