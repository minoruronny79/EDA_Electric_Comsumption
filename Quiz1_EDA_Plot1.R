#######################################################################
##########################Plot 1#######################################


#Getting the data
household<-read.csv("F:/Edu_Universidad/4_Online/1_Coursera/Econometrics/JHopkins_Datascience/4_Exploratory_Data/EDA_Week1/Quiz_EDA_W1/house.txt", sep=";", header = TRUE, na.strings="?")

setwd("F:/RTraining/EDA")


##############################################################
#Converting some variables 
household$zdate <- as.Date(household$Date, format="%d/%m/%Y")


#############################################################
#Subsetting the data
householdsub<-subset(household, subset=(zdate >= "2007-02-01" & zdate <= "2007-02-02"))


############################################
#Graphic 1
range(householdsub$Global_active_power) #Checking the range
hist(householdsub$Global_active_power, main="Global Active Power", xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red")

#Saving the Graphic1
dev.copy(png, file="Plot1.png", height=480, width=480)
dev.off()
