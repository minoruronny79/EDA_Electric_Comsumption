#######################################################################
##########################Plot 4#######################################

#Getting the data
household<-read.csv("F:/Edu_Universidad/4_Online/1_Coursera/Econometrics/JHopkins_Datascience/4_Exploratory_Data/EDA_Week1/Quiz_EDA_W1/house.txt", sep=";", header = TRUE, na.strings="?")

#Setting my working directory
setwd("F:/Edu_Universidad/4_Online/1_Coursera/Econometrics/JHopkins_Datascience/4_Exploratory_Data/EDA_Week1/Quiz_EDA_W1")
setwd("F:/RTraining/EDA")



#A overview of data
head(household)
str(household)


##############################################################
#Converting some variables 
household$zdate <- as.Date(household$Date, format="%d/%m/%Y")


#############################################################
#Subsetting the data
householdsub<-subset(household, subset=(zdate >= "2007-02-01" & zdate <= "2007-02-02"))


##############################################
## Date and time
datetime <- strptime(paste(householdsub$Date, householdsub$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
#datetime <- paste(as.Date(householdsub$Date), householdsub$Time) It has some problems
householdsub$Datetime <- as.POSIXct(datetime)


###########################################
#Graphic 4
par(mfrow=c(2,2), mar=c(4,4,2,1), oma=c(0,0,2,0))
#Graph 4.1
plot(householdsub$Global_active_power~householdsub$Datetime, type="l", ylab="Global Active Power (kilowatts)", xlab="")

#Graph 4.2
plot(householdsub$Voltage~householdsub$Datetime, type="l", ylab="Voltage", xlab="")

#Graph 4.3
plot(householdsub$Sub_metering_1~householdsub$Datetime, type="l", ylab="Energy submtering", xlab="")
lines(householdsub$Sub_metering_2~householdsub$Datetime, type="l", col="red")
lines(householdsub$Sub_metering_3~householdsub$Datetime, type="l", col="blue")
legend("topright", pch=1, legend=c("submetering1", "submetering2", "submetering3"), col=c("black","red","blue"), cex = 0.16)

#Graph 4.4
plot(householdsub$Global_reactive_power~householdsub$Datetime, type="l", ylab="Global Reactive Power", xlab="")

#Saving the Graphic4
dev.copy(png, file="Plot4.png", height=480, width=480)
dev.off()
