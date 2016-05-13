#######################################################################
##########################Plot 2#######################################

#Getting the data
household<-read.csv("F:/Edu_Universidad/4_Online/1_Coursera/Econometrics/JHopkins_Datascience/4_Exploratory_Data/EDA_Week1/Quiz_EDA_W1/house.txt", sep=";", header = TRUE, na.strings="?")


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


############################################
#Graphic 2
plot(householdsub$Global_active_power~householdsub$Datetime, type="l", ylab="Global Active Power (kilowatts)", xlab="")

#Saving the Graphic2
dev.copy(png, file="Plot2.png", height=480, width=480)
dev.off()