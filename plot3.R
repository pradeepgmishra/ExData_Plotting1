library(data.table)
plot3 <- function() {  
  ## Read data  
  x = "household_power_consumption.txt"
  data <- fread(input=x,sep = ';',na.strings="?",select=c("Date","Time","Sub_metering_1","Sub_metering_2","Sub_metering_3"))
  data[, datetime:= paste(Date,Time)]  
  data[, posix:= as.POSIXct(strptime(datetime,"%d/%m/%Y %H:%M:%S"))]  
  data[, datenew:= as.Date(Date,"%d/%m/%Y")]    
  data <- data[!is.na(Date),]
  data <- data[data$datenew >= as.Date("2007-02-01")]  
  data <- data[data$datenew < as.Date("2007-02-03")]  
  png(file="plot3.png",width=480,height=480)
  with(data,{plot(posix,Sub_metering_1,type="l",ylab="Energy sub metering")              
             lines(posix,Sub_metering_2,type="l",col="red") 
             lines(posix,Sub_metering_3,type="l",col="blue")
             legend("topright",col = c("black","blue", "red"), legend = c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"),lty=c(1,1,1),bty="n")
             })
  dev.off()
}