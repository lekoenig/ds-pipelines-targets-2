library(targets)

options(tidyverse.quiet = TRUE)
tar_option_set(packages = c("tidyverse", "dataRetrieval")) # Loading tidyverse because we need dplyr, ggplot2, readr, stringr, and purrr

source("1_fetch.R")
source("2_process.R")
source("3_visualize.R")

site_nums <- c("01427207","01432160","01435000","01436690","01466500")

# Return the complete list of targets
c(p1_targets_list, p2_targets_list, p3_targets_list)
