## Creates the first plot for the first Course 
## Project in the Exploratory Data Analysis
## course.
plot1 <- function() {
  library(data.table)
  
  if(!file.exists("household_power_consumption.txt"))
    stop("File doesn't exist.")
  
  data <- read.table("household_power_consumption.txt", sep = ";", header = TRUE, colClasses = "character")
  
  data[data == "?"] <- NA
  
  ## Converting Date and Time columns to Date/Time classes
  data$Date <- as.Date(data$Date, format = "%d/%m/%Y")
  data$Time <- strptime(data$Time, format = "%H:%M:%S")
  
##  png("plot1.png")
  hist(as.numeric(data$Global_active_power), col = "red", xlab = "Global active power (kilowatts)", main = "Global Active Power")
  axis(1, at = seq(0, 6, by = 2))
  
##  dev.off()
}