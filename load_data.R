# Load the dataset into R

date_time <- function(date, time) {
    return (strptime(paste(date, time), "%d/%m/%Y %H:%M:%S"))
}

load_data <- function() {
    filename <- "household_power_consumption.txt"
    
    # missing values are coded as ?
    df <- read.table(filename,
                     header = TRUE,
                     sep = ";",
                     colClasses = c("character", "character", rep("numeric",7)),
                     na = "?")
    
    # convert the Date and Time variables to Date/Time classes in R
    df$Time <- strptime(paste(df$Date, df$Time), "%d/%m/%Y %H:%M:%S")
    df$Date <- as.Date(df$Date, "%d/%m/%Y")
    
    # using data only from the dates 2007-02-01 and 2007-02-02
    dates <- as.Date(c("2007-02-01", "2007-02-02"), "%Y-%m-%d")
    df <- subset(df, Date %in% dates)
    
    return(df)
}
