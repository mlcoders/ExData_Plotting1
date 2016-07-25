# Author: MLCoder
# Load and clean the Household Power Consumption (HPC) data
# Create a lightweight version with the relevant date range
# This script is sourced by the PlotX.R scritps

# Only run the following code if the input object hpc doesn't exist
if(!exists("hpc")){
        # Making sure data sub-folder is created
        if(!dir.exists("./data/"))
                dir.create("./data")
        # Getting the dataset from the remote site and extracting if not there
        if(!file.exists("./data/household_power_consumption.txt")){
                download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip",
                              "./data/dataset.zip")
                unzip("./data/dataset.zip",exdir = "./data/")
        }
        # Load the dataset if doesn't exist
        if(!exists("full_hpc"))
                full_hpc<-read.csv("./data/household_power_consumption.txt",
                                   na.strings = "?",
                                   sep = ";")
        # Subsetting on 1 & 2 of Feb 2007
        hpc<-subset(full_hpc,grepl("^[12]/2/2007$",Date))
        # Merging Date and Time variables and formating to Date class
        hpc$Date<-strptime(paste(hpc$Date,hpc$Time,sep = " "),format = "%d/%m/%Y %H:%M:%S")
        # Get rid of the Time variable
        hpc<-hpc[,-2]
}


