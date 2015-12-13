# plot1
# R Script to create required plots
# RVT 13-12-2015

# Set working dir
setwd("C:/Users/Eli/Documents/datasciencecoursera/ExData_Plotting1")

png("plot1.png", width = 480, height = 480)
hist(loaddata$Global_active_power, main = "Global Active Power", xlab = "Global Active Power (kilowatts)", ylab = "Frequency", col = "red")
dev.off()
