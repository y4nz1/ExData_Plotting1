################################################################################
## Coursera - Exploratory Data Analysis - Week 1 Assignment 1                 ##
################################################################################

## Prerequisites
## 1. Ensure that file household_power_consumption.txt is already in current
##    working directory (File can be downloaded from :
##    http://archive.ics.uci.edu/ml/)
## 2. data.table package has been downloaded and installed.  To install, type
##      install.packages("data.table")

## Objective : To plot Global Active Power in a line graph for the 1st and 2nd
## of Feb 2007 and save it in .png format.

## Requirements :
## 1. Title = <blank>
## 2. X-axis label = <blank>
## 3. Y-axis label = Global Active Power (kilowatts)
## 4. Background color = Transparent
## 5. Size = 480 x 480 pixels

## Load data.table library
library(data.table)

## Read file into data table with default parameters; this will take a while
## with warning messages about the presence of ? character in some columns.
## This will be dealt with in later steps.
## 2,075,259 rows
data <- fread("household_power_consumption.txt")

## Subset the rows for 1st and 2nd Feb 2007; this might take a while
## 2,880 rows
sub.data <- subset(data, between(strptime(Date, "%d/%m/%Y"),
                                 strptime("1/2/2007", "%d/%m/%Y"),
                                 strptime("2/2/2007", "%d/%m/%Y")))

## Uncomment the code below to remove the original data set to free up the space
## if necessary
## rm(data)

## Plot to png device, by default, width and height are at 480 pixels
png("plot2.png", bg = "transparent")

## create line graph per requirements above
## Paste Date and Time column together to convert to datetime for plotting on
## the X-axis
## Global_active_power column is converted to number, supressing any warnings
## that ? characters bring
with(sub.data, plot(strptime(paste(Date, Time), "%d/%m/%Y %H:%M:%S"),
                    suppressWarnings(as.numeric(Global_active_power)),
                    ylab = "Global Active Power (kilowatts)",
                    xlab = "", type = "l"))

## Remember to close device
dev.off()
