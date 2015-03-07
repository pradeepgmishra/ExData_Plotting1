library(data.table)
plot1 <- function() {  
  ## Read data
  x = "household_power_consumption.txt"
  data <- fread(input=x,sep = ';',na.strings="?",select=c("Date","Time","Global_active_power"))
  data[, datenew:= as.Date(Date,"%d/%m/%Y")]
  data <- data[data$datenew >= as.Date("2007-02-01")]
  data <- data[data$datenew < as.Date("2007-02-03")]
  png(file="plot1.png",width=480,height=480)  
  with(data,hist(as.numeric(Global_active_power),breaks=11,col="red",main="Global Active Power",xlab="Global Active Power (kilowatts)"))
  dev.off()
}