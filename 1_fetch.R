source("1_fetch/src/get_nwis_data.R")

p1_targets_list <- list(
  tar_target(
    p1_nwis_01427207_csv,
    download_nwis_site_data(file_save_path = "1_fetch/out",site_num = site_nums[1]),
    format="file"),
  tar_target(
    p1_nwis_01432160_csv,
    download_nwis_site_data(file_save_path = "1_fetch/out",site_num = site_nums[2]),
    format="file"),
  tar_target(
    p1_nwis_01435000_csv,
    download_nwis_site_data(file_save_path = "1_fetch/out",site_num = site_nums[3]),
    format="file"),
  tar_target(
    p1_nwis_01436690_csv,
    download_nwis_site_data(file_save_path = "1_fetch/out",site_num = site_nums[4]),
    format="file"),
  tar_target(
    p1_nwis_01466500_csv,
    download_nwis_site_data(file_save_path = "1_fetch/out",site_num = site_nums[5]),
    format="file"),
  tar_target(
    p1_combined_site_data, 
    combine_site_data(c(p1_nwis_01427207_csv,p1_nwis_01432160_csv,p1_nwis_01435000_csv,p1_nwis_01436690_csv,p1_nwis_01466500_csv))),
  tar_target(
    p1_site_info,
    nwis_site_info(p1_combined_site_data))
)
