# 1. Read the dataset with prepare_data.R
## By default, the dataset is stored in "df"
source("prepare_data.R")

# 2. Plot the data
dev.off()
png(filename = "plot3.png", width = 480, height = 480)
## In prepare_data.R, the "date" and "time" columns have already been 
## combined into one column "time" to make it eaiser to plot.
with(df, plot(time, sub_metering_1, type = "n"))
with(df, lines(time, sub_metering_1))
with(df, lines(time, sub_metering_2, col = "red"))
with(df, lines(time, sub_metering_3, col = "blue"))
legend("topright",
       lty = 1,
       col = c("black", "red", "blue"),
       legend = c("sub_metering_1", "sub_metering_2", "sub_metering_3"))

# 3. Save to plot3.png
dev.off()