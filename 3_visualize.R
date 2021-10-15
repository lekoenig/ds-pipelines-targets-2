source("3_visualize/src/plot_timeseries.R")

p3_targets_list <- list(
  tar_target(
    p3_figure_1_draft,
    plot_nwis_timeseries(processed_data_file = p2_site_data_processed_csv)
  )
)
