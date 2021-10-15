plot_nwis_timeseries <- function(fileout, processed_data_file, width = 12, height = 7, units = 'in'){
  
  site_data_processed <- read_csv(processed_data_file)
  
  ggplot(data = site_data_processed, aes(x = dateTime, y = water_temperature, color = station_name)) +
    geom_line() + theme_bw()
  ggsave(fileout, width = width, height = height, units = units)
  
  return(fileout)
}
