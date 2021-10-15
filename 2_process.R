source("2_process/src/process_and_style.R")

p2_targets_list <- list(
  tar_target(
    p2_site_data_processed_csv, 
    process_data(fileout = "2_process/out/site_data_processed.csv",p1_combined_site_data,p1_site_info),
    format = "file"
  )
)
