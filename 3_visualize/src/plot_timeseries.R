options (readr.show_types = FALSE)

plot_nwis_timeseries <- function(processed_data_file){
  
  site_data_processed <- read_csv(processed_data_file)
  
  temp_plot <- ggplot(data = site_data_processed, aes(x = dateTime, y = water_temperature, color = station_name)) +
    geom_line() + theme_bw()

  return(temp_plot)
}
