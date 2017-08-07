# 1. Read the dataset with prepare_data.R
## By default, the dataset is stored in "df"
source("prepare_data.R")

# 2. Make the histogram
dev.off()
with(df, hist(global_active_power, col = "red",
              main = "Global Active Power",
              xlab = "Global Active Power (kilowatts)"))

# 3. Save to plot1.png
dev.copy(device = png, file = "plot1.png", width = 480, height = 480)
dev.off()