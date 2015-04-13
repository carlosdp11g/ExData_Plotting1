## Creates the second plot for the first Course 
## Project in the Exploratory Data Analysis
## course.

plot2 <- function() {
  library(data.table)
  
  if(!file.exists("household_power_consumption.txt"))
    stop("File doesn't exist.")
  
  data <- read.table("household_power_consumption.txt", sep = ";", header = TRUE, colClasses = "character")
  
  data[data == "?"] <- NA
  
  ## Converting Date and Time columns to Date/Time classes
  data$Date <- as.Date(data$Date, format = "%d/%m/%Y")
  data$Time <- strptime(data$Time, format = "%H:%M:%S")
  
  png("plot2.png")
  with(data, plot(Date, Global_active_power))
  
  dev.off()
}