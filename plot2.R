# plot2
# R Script to create required plots
# RVT 13-12-2015

# Set working dir
setwd("C:/Users/Eli/Documents/datasciencecoursera/ExData_Plotting1")

png("plot2.png", width = 480, height = 480)
plot(loaddata$Time, loaddata$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")
dev.off()
