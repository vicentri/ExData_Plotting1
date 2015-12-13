#
# R Script to create required directorie(s) and load data locally
# RVT 12-12-2015

library(httr) 
# Set working dir
setwd("C:/Users/Eli/Documents/datasciencecoursera/ExData_Plotting1")

# https removed due to problems with curl method
url <- "http://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"

mydata <- "data"
# Check dir exists and create it if not
if(!file.exists(mydata)){
	dir.create(mydata)
} 

myfile <- paste(getwd(), "/data/household_power_consumption.zip", sep = "")

# Download from url
download.file(url, myfile)

# Unzip file
# not needed original filename assumed for unzip
# myfile2 <- paste(getwd(), "/data/household_power_consumption.txt", sep = "")

# Check if file already exists and unzip it if not
if(!file.exists(myfile2)){
	unzip(myfile, exdir = mydata)
}

# As the data to be used is a subset of time/date from the original file downloaded 
# only load the required dates using strptime and subset(improve performance)
# take into account NA vars as ?

# Define path and file name
rdsfile <- paste(getwd(), "/data/defdata.rds", sep = "")

if(!file.exists(rdsfile)){

	mydata <- "data/household_power_consumption.txt"
	loaddata <- read.table(mydata, header=TRUE, sep=";", colClasses=c("character", "character", rep("numeric",7)), na="?")
	loaddata$Time <- strptime(paste(loaddata$Date, loaddata$Time), "%d/%m/%Y %H:%M:%S")
	loaddata$Date <- as.Date(loaddata$Date, "%d/%m/%Y")
	reqdates <- as.Date(c("2007-02-01", "2007-02-02"), "%Y-%m-%d")
	loaddata <- subset(loaddata, Date %in% reqdates)
	rdsfile <- paste(getwd(), "/data/defdata.rds", sep="")
	saveRDS(loaddata, rdsfile)

} else {
	mydata <- "data/defdata.rds"
	loaddata <- readRDS(mydata)
}
