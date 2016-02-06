##import data
household_power_consumption <- read.csv("~/Documents/R_working_Dir/ExploratoryDataAnalysis/household_power_consumption.txt", sep=";")

#view imported data
##View(household_power_consumption)

# filter data to be between 2007/2/1 and 2007/2/2
household_power_consumption_filtered =  subset(household_power_consumption , (  as.Date(strptime(Date , "%d/%m/%Y" )) >= "2007-02-01" ) & (  as.Date(strptime(Date , "%d/%m/%Y" )) <= "2007-02-02" )  ) 


#create histogram #4
png(file="plot4.png" , width=480 , height=480  )

par(mfrow=c(2, 2))

#topleft
with( household_power_consumption_filtered, plot( as.POSIXct(paste(Date , Time) , format="%d/%m/%Y %H:%M:%S" ) ,  as.numeric(Global_active_power) , type="l" , ylab = "Global Active Power (kilowatts)" , xlab="" ) )


#topright
with( household_power_consumption_filtered, plot( as.POSIXct(paste(Date , Time) , format="%d/%m/%Y %H:%M:%S" ) ,  as.numeric(Voltage) , type="l" , ylab = "Voltage(Volts)" , xlab="datetime" ) )


#bottomleft
with( household_power_consumption_filtered, plot( as.POSIXct(paste(Date , Time) , format="%d/%m/%Y %H:%M:%S" ) ,  as.numeric(Sub_metering_1) , type="l" , ylab = "Energy Sub Metering" , xlab="" ) )
with( household_power_consumption_filtered, lines( as.POSIXct(paste(Date , Time) , format="%d/%m/%Y %H:%M:%S" ) ,  as.numeric(Sub_metering_2) , type="l" , col="red" ) )
with( household_power_consumption_filtered, lines( as.POSIXct(paste(Date , Time) , format="%d/%m/%Y %H:%M:%S" ) ,  as.numeric(Sub_metering_3) , type="l" , col="blue" ) )
legend("topright" , colnames(household_power_consumption_filtered)[7:9] , col=c("black", "red", "blue") , lty=1 )

#bottomright
with( household_power_consumption_filtered, plot( as.POSIXct(paste(Date , Time) , format="%d/%m/%Y %H:%M:%S" ) ,  as.numeric(Global_reactive_power) , type="l" , ylab = "Global_reactive_power(KiloWatts)" , xlab="datetime" ) )

#reset par to default
par(mfrow=c(1, 1))


dev.off()

