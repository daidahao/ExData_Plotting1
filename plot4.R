# 1. Read the dataset with prepare_data.R
## By default, the dataset is stored in "df"
source("prepare_data.R")

# 2. Plot the data
dev.off()
png(filename = "plot4.png", width = 480, height = 480)
## In prepare_data.R, the "date" and "time" columns have already been 
## combined into one column "time" to make it eaiser to plot.
par(mfrow = c(2, 2))
with(df, {
  # Subplot 1: time versus global_active_power
  plot(time, global_active_power, type = "l", ylab = "Gloabl Active Power (killowatts)")
  # Subplot 2: time versus voltage
  plot(time, voltage, type = "l", ylab = "Voltage")
  # Subplot 3: time versus sub_metering
  {
    plot(time, sub_metering_1, type = "n", ylab = "Energy Sub Metering")
    lines(time, sub_metering_1)
    lines(time, sub_metering_2, col = "red")
    lines(time, sub_metering_3, col = "blue")
    legend("topright",
           lty = 1,
           bty = "n",
           col = c("black", "red", "blue"),
           legend = c("sub_metering_1", "sub_metering_2", "sub_metering_3"))
  }
  # Subplot 4: time versus global_reactive_power
  plot(time, global_reactive_power, type = "l", ylab = "Global Reactive Power")
})

# 3. Save to plot4.png
dev.off()