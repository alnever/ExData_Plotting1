## Plot 1 by Al.Neverov

library(dplyr)

## Download and unzip datafile

if (!file.exists("household_power_consumption.txt")) {
	if (!file.exists("exdata_data_household_power_consumption.zip")) {
            fileUrl = "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
		download.file(fileUrl, "exdata_data_household_power_consumption.zip")	
	}
	unzip("exdata_data_household_power_consumption.zip")
}

## Read datafile and filter it

data <- tbl_df(read.table("household_power_consumption.txt", 
                   sep=";", 
                   header = TRUE,
                   na.strings=c("NA","N/A","null","?"),
	             stringsAsFactors = FALSE,			
                   colClasses = c("character", "character", rep("numeric", times = 7)))) %>%
          mutate(Date = as.Date(Date,"%d/%m/%Y")) %>%
          filter(as.POSIXlt(Date)$year + 1900 == 2007 & as.POSIXlt(Date)$mon + 1 == 2 & as.POSIXlt(Date)$mday %in% c(1,2)) %>%
	    mutate(DayOfWeek = as.POSIXlt(Date)$wda)	

## Set parameters for device (screen)

par(mfrow = c(1,1))

## Draw the histogram

hist(data$Global_active_power, 
               col = "red", 
               xlab = "Global Active Power (kilowatts)",
               main = "Global Active Power"
     )

## Copy the histogram into the png file

dev.copy(png, "plot1.png")
dev.off()