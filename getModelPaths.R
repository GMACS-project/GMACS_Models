#' 
#' @title Get paths to model files as a dataframe
#' @description Function to get paths to model files s a dataframe 
#' @param topDir - path to top directory in model files hierarchy 
#' @param csv filename for output csv file 
#' @param overwrite - flag to overwrite `csv` if it already exists
#' @return a dataframe with model path information
#' @details Returns a dataframe with columns
#' \itemize{
#'   \item{path - path to model folder from `topDir`}
#'   \item{gmacs_dat - "gmacs.dat" or NA (if missing)}
#'   \item{dat_file - dat file(s) or NA (if missing)}
#'   \item{ctl_file - ctl file(s) or NA (if missing)}
#'   \item{prj_file - prj file(s) or NA (if missing)}
#'   \item{pin_file - pin file(s) or NA (if missing)}
#'   \item{par_file - par file(s) or NA (if missing)}
#'   \item{allout_file -allout file(s) or NA (if missing)}
#' } 
#' Only one file of each type should be included in each model folder. 
#' Currently (2025-01023), several folders have multiple files of one type or 
#' another. These need to be re-organized into multiple folders, with one file 
#' type per folder. 
#' 
#' Files that don't match the standard GMACS file types defined in [getFileType()] 
#' are ignored.
#' 
#' @import dplyr 
#' @import tidyr
#' @export
#' 
getModelPaths<-function(topDir="./all_models",csv="./models-all.csv",overwrite=FALSE){
  if (!exists("getFileType")) source("./getFileType.R");
  paths = list.dirs(topDir,full.names=FALSE,recursive=TRUE);
  lst = list(); ctr=0;
  for (pth in paths){
    fls = list.files(file.path(topDir,pth),include.dirs=TRUE);
    for (fl in fls){
      if (!file.info(file.path(topDir,pth,fl))$isdir){
        lst[[ctr<-ctr+1]] = list(path=pth,file=fl);
      }
    }
  }
  dfr = dplyr::bind_rows(lst) |> 
          dplyr::filter(path!="") |> 
          dplyr::rowwise() |> 
          dplyr::mutate(type=getFileType(file,path)) |> 
          dplyr::filter(type!="unknown") |> 
          dplyr::group_by(path,type) |> 
          dplyr::summarize(files=paste(file,collapse=", ")) |> 
          dplyr::ungroup() |> 
          tidyr::pivot_wider(names_from=type,values_from=files) |> 
          dplyr::relocate(path,gmacs_dat,dat_file,ctl_file,prj_file,pin_file,par_file,allout_file);
  if ((!file.exists(csv))||overwrite) 
    readr::write_csv(dfr,csv);
  return(dfr);
}
