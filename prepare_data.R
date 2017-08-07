# 1. Create a data directory
dirpath = "data"
if(!dir.exists(dirpath)){
  dir.create(dirpath)
}

# 2. Download the dataset
dlMethod <- "curl" # sets default for OSX / Linux
zipfile = paste(dirpath, "household_power_consumption.zip", sep = "/")
datafile = paste(dirpath, "household_power_consumption.txt", sep = "/")
if(substr(Sys.getenv("OS"),1,7) == "Windows") dlMethod <- "wininet"
if(!file.exists(zipfile)) {
  download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip",
                zipfile,  # stores file in R working directory
                method=dlMethod) # use OS-appropriate method
}

# 3. Unzip the zip file
if(!file.exists(datafile)){
  unzip(zipfile, exdir = dirpath)
}

# 4. Estimate the memory usage
cat("Estimated Memory Usage:", 2075259 * 9 * 8 / (2 ^ 20), "MB")

# 5. Load the dataset
library(readr)
df <- read_delim(datafile, delim = ";", na = c("", "?"))
colnames(df) <- tolower(colnames(df))

# 6. Calculate the actual memory usage
cat("Actual Memory Usage:", format(object.size(df), units = "MB"))

# 7. Subset by the date between 2007-02-01 and 2007-02-02
## The data and time columns are combined here to make ploting easier
library(lubridate)
df <- df %>%
  mutate(time = dmy_hms(paste(date, time))) %>%
  select(-date) %>%
  filter(year(time) == 2007, month(time) == 2, mday(time) == 1 | mday(time) == 2)




