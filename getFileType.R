#' 
#' @title Get the type of a GMACS file
#' @description Function to get the type of a file (not necessarily its extension).
#' @param fn - file name (without path)
#' @param path - path to file 
#' @return type of GMACS file 
#' @details The returned file type is one of 
#' \itemize{
#' \item{"gmacs_dat" - for a gmacs.dat file}
#' \item{"dat_file" - for a gmacs file (other than "gmacs.dat") ending in ".dat"}
#' \item{"ctl_file" - for a gmacs file ending in ".ctl"}
#' \item{"prj_file" - for a gmacs file ending in ".prj"}
#' \item{"allout_file" - for a file starting with "Gmacsall"}
#' \item{"pin_file" - for a gmacs .pin file}
#' \item{"par_file" - for a gmacs .par file}
#' \item{"unknown" - for files not matching any of the above}
#' }
#' @importFrom stringr str_ends
#' @importFrom stringr str_starts
#' @export
#' 
getFileType<-function(fn,path){
  if (length(fn)>1) 
    message(paste0("Multiple types for ",path,": ",fn,"\n"));
  type="unknown";
  if (fn=="gmacs.pin"){
    type = "pin_file";
  } else if (fn=="gmacs.par"){
    type = "par_file";
  } else if (fn=="gmacs.dat"){
    type = "gmacs_dat";
  } else if (stringr::str_ends(fn,".dat")){
    type = "dat_file";
  } else if (stringr::str_ends(fn,".prj")){
    type = "prj_file";
  } else if (stringr::str_ends(fn,".ctl")){
    type = "ctl_file";
  } else if (stringr::str_starts(fn,"Gmacsall")){
    type = "allout_file";
  }
  return(type);
}
