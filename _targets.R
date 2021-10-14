library(targets)
source("1_fetch/src/get_nwis_data.R")
source("2_process/src/process_and_style.R")
source("3_visualize/src/plot_timeseries.R")

options(tidyverse.quiet = TRUE)
tar_option_set(packages = c("tidyverse", "dataRetrieval")) # Loading tidyverse because we need dplyr, ggplot2, readr, stringr, and purrr

site_nums <- c("01427207","01432160","01435000","01436690","01466500")

p_width <- 12
p_height <- 7
p_units <- "in"

p1_targets_list <- list(
  tar_target(
    nwis_01427207_csv,
    download_nwis_site_data(file_save_path = "1_fetch/out",site_num = site_nums[1]),
    format="file"),
  tar_target(
    nwis_01432160_csv,
    download_nwis_site_data(file_save_path = "1_fetch/out",site_num = site_nums[2]),
    format="file"),
  tar_target(
    nwis_01435000_csv,
    download_nwis_site_data(file_save_path = "1_fetch/out",site_num = site_nums[3]),
    format="file"),
  tar_target(
    nwis_01436690_csv,
    download_nwis_site_data(file_save_path = "1_fetch/out",site_num = site_nums[4]),
    format="file"),
  tar_target(
    nwis_01466500_csv,
    download_nwis_site_data(file_save_path = "1_fetch/out",site_num = site_nums[5]),
    format="file"),
  tar_target(
    combined_site_data, 
    combine_site_data(c(nwis_01427207_csv,nwis_01432160_csv,nwis_01435000_csv,nwis_01436690_csv,nwis_01466500_csv))),
  tar_target(
    site_info_csv,
    nwis_site_info(fileout = "1_fetch/out/site_info.csv",combined_site_data))
)

p2_targets_list <- list(
  tar_target(
    site_data_processed, 
    process_data(combined_site_data,site_info_csv)
  )
)

p3_targets_list <- list(
  tar_target(
    figure_1_png,
    plot_nwis_timeseries(fileout = "3_visualize/out/figure_1.png", site_data_processed,
                         width = p_width, height = p_height, units = p_units),
    format = "file"
  )
)

# Return the complete list of targets
c(p1_targets_list, p2_targets_list, p3_targets_list)
