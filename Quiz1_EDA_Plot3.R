#######################################################################
##########################Plot 3#######################################

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
#Graphic 3
plot(householdsub$Sub_metering_1~householdsub$Datetime, type="l", ylab="Energy submetering", xlab="")
lines(householdsub$Sub_metering_2~householdsub$Datetime, type="l", col="red")
lines(householdsub$Sub_metering_3~householdsub$Datetime, type="l", col="blue")
legend("topright", pch=1, legend=c("submetering1", "submetering2", "submetering3"), col=c("black","red","blue"), cex = 0.5)

#Saving the Graphic3
dev.copy(png, file="Plot3.png", height=480, width=480)
dev.off()