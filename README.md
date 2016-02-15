#  Course projet 01 
## Exploratory Data Analysis
#### by Aleksei Neverov

## Solution description

There are four script files to create different graphics for this course project:

1. `plot1.R` - creates an histogram. Creates output file `plot1.png`
1. `plot2.R` - creates a linear graphics showing the global active power level (in kilowatts). Creates output file `plot2.png`
1. `plot3.R` - creates three linear graphics within one layout for different Sub meterings. Creates output file `plot3.png`
1. `plot4.R` - creates four graphics in different parts of the lay out. Creates output file `plot4.png`
 
The result files are included in repo too.

To run the script just call the source function with a script name as its argument. For example,


    source("plot1.R")

I didn't change the regional settings of my system, so you can see russian names of weekdays on the graphics:

1. Чт = Thu
1. Пт = Fri
1. Сб = Sat


The data file for this project is very big, so I didn't put it into the repo. Instead of this every script contains a part of code that allows to download zip-file with the source data and then unzip it:

    if (!file.exists("household_power_consumption.txt")) {
    	if (!file.exists("exdata_data_household_power_consumption.zip")) {
    fileUrl = "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
    		download.file(fileUrl, "exdata_data_household_power_consumption.zip")	
    	}
    	unzip("exdata_data_household_power_consumption.zip")
    }
    
If you have a data file `household_power_consumption.txt` on your computer, just copy it into the same folder, where were downloaded the scripts.

More than you can download zip-file with the data sourse [Electric power consumption](https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip)

By reading and preparing data for plotting the library `dplyr` were used. The call of this library is included in
every script above. If you don't have this library installed in your R-system, exceute the following function:

    install.packages("dplyr")
 


