# 1. Read the dataset with prepare_data.R
## By default, the dataset is stored in "df"
source("prepare_data.R")

# 2. Plot the data
dev.off()
## In prepare_data.R, the "date" and "time" columns have already been 
## combined into one column "time" to make it eaiser to plot.
with(df, plot(time, global_active_power, type = "l"))

# 3. Save to plot2.png
dev.copy(device = png, file = "plot2.png", width = 480, height = 480)
dev.off()