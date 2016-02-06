##import data
household_power_consumption <- read.csv("~/Documents/R_working_Dir/ExploratoryDataAnalysis/household_power_consumption.txt", sep=";")

#view imported data
##View(household_power_consumption)

# filter data to be between 2007/2/1 and 2007/2/2
household_power_consumption_filtered =  subset(household_power_consumption , (  as.Date(strptime(Date , "%d/%m/%Y" )) >= "2007-02-01" ) & (  as.Date(strptime(Date , "%d/%m/%Y" )) <= "2007-02-02" )  ) 


#create histogram #1
png(file="plot1.png" , width=480 , height=480  )
hist(  as.numeric(household_power_consumption_filtered$Global_active_power) , xlab = "Global Active Power (kilowatts)" , ylab = "Frequency" , col="red" , main="Global Active Power" )
dev.off()

