library(data.table)
plot2 <- function() {  
  ## Read data  
  x = "household_power_consumption.txt"
  data <- fread(input=x,sep = ';',na.strings="?",select=c("Date","Time","Global_active_power"))  
  data[, datetime:= paste(Date,Time)]  
  data[, posix:= as.POSIXct(strptime(datetime,"%d/%m/%Y %H:%M:%S"))]  
  data[, datenew:= as.Date(Date,"%d/%m/%Y")]  
  data <- data[!is.na(Date),]
  data <- data[data$datenew >= as.Date("2007-02-01")]  
  data <- data[data$datenew < as.Date("2007-02-03")]  
  png(file="plot2.png",width=480,height=480)
  with(data,plot(posix,Global_active_power,type="l",ylab="Global Active Power (kilowatts)"))
  dev.off()
}