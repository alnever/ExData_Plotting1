## Plot 4 by Al.Neverov

library(dplyr)

## Download and unzip datafile

c

## Read datafile and filter it

weekdays <- c("Sun", "Mon", "", "", "Thu", "Fri", "Sat")

data <- tbl_df(read.table("household_power_consumption.txt", 
                   sep=";", 
                   header = TRUE,
                   na.strings=c("NA","N/A","null","?"),
	             stringsAsFactors = FALSE,			
                   colClasses = c("character", "character", rep("numeric", times = 7)))) %>%
          mutate(aDateTime = paste(Date, Time, sep = " "),
                 Date = as.Date(Date,"%d/%m/%Y"), 
                 pDateTime = as.POSIXct(aDateTime, format = "%d/%m/%Y %H:%M:%S") ) %>%
          filter(as.POSIXlt(Date)$year + 1900 == 2007 & as.POSIXlt(Date)$mon + 1 == 2 & as.POSIXlt(Date)$mday %in% c(1,2))

## Set parameters for device (screen)

par(mfrow = c(2,2))

###################################
### Prepare 1ts graph in cell [1,1]

with(data, plot(pDateTime, Global_active_power, 
                type = "l", 
                xlab = "", main = "", 
                ylab = "Global Active Power (kilowatts)" 
    ))


####################################
### Prepare 2nd  graph in cell [1,2]

with(data, plot(pDateTime, Voltage, 
                type = "l", 
                xlab = "datetime", main = "", 
                ylab = "Voltage" 
    ))

###################################
### Prepare 3rd graph in cell [2,1]

with(data, plot(pDateTime, Sub_metering_1, col = "black", type = "l", 
                xlab = "", main = "", ylab = "Energy sub metering" 
    ))

## Add lines for Sub metering 2

with(data, lines(pDateTime, Sub_metering_2, col = "red", type = "l", 
                xlab = "", main = "", ylab = "Energy sub metering" 
    ))

## Add lines for Sub metering 3

with(data, lines(pDateTime, Sub_metering_3, col = "blue", type = "l", 
                xlab = "", main = "", ylab = "Energy sub metering" 
    ))

## Add legend

legend("topright", 
       col = c("black", "red", "blue"), 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       lty = 1, lwd = 1
      )

###################################
### Prepare 4th graph in cell [2,2]

with(data, plot(pDateTime, Global_reactive_power, 
                type = "l", 
                xlab = "datetime", main = "" 
    ))

## Copy the graph into the png file

dev.copy(png, "plot4.png")

dev.off()







