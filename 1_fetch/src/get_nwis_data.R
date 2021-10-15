
combine_site_data <- function(file_path){
  
  data_out <- data.frame()
  # loop through files to download 
  for (file in file_path){
    # read the downloaded data and append it to the existing data.frame
    these_data <- read_csv(file, col_types = 'ccTdcc')
    data_out <- bind_rows(data_out, these_data)
  }
  return(data_out)
}

nwis_site_info <- function(fileout, site_data){
  site_no <- unique(site_data$site_no)
  site_info <- dataRetrieval::readNWISsite(site_no)
  write_csv(site_info, fileout)
  return(fileout)
}


download_nwis_site_data <- function(file_save_path, site_num, parameterCd = '00010', startDate="2014-05-01", endDate="2015-05-01"){
  
  file_path <- file.path(file_save_path, paste0('nwis_', site_num, '_data.csv'))
  
  # filepaths look something like directory/nwis_01432160_data.csv,
  # remove the directory with basename() and extract the nwis site number with the regular expression match
  site_num <- basename(file_path) %>% 
    stringr::str_extract(pattern = "(?:[0-9]+)")
  
  # readNWISdata is from the dataRetrieval package
  data_out <- readNWISdata(sites=site_num, service="iv", 
                           parameterCd = parameterCd, startDate = startDate, endDate = endDate)

  # -- simulating a failure-prone web-sevice here, do not edit --
  set.seed(Sys.time())
  if (sample(c(T,F,F,F), 1)){
    stop(site_num, ' has failed due to connection timeout. Try tar_make() again')
  }
  # -- end of do-not-edit block
  
  write_csv(data_out, file = file_path)
  return(file_path)
}

