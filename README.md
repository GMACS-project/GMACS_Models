# GMACS_Models

This is a repository for GMACS model files.

## Contents

This repository consists of:

* This README.md file
* "all_models": a folder with subfolders identified by model name, typically "stock_date", where "stock" the stock name and "date" is a relevant date (most informational would be the date the model was run, but this does not need to be the case). In some cases, it may be helpful to add other descriptors to the subfolder name to identify the model. Within each subfolder, the following files would *ideally* be included:
  - gmacs.dat: the input gmacs.dat file for the model run
  - the input model .dat file
  - the input model ctl file
  - the input model prj file
  - the output 'par' file ('gmacs.par') from the converged model
  - the output 'out' file ('Gmacsall.out') from the converged model
  - other output files, as desired 
* R code:
  - "getModelPaths.R": defines a function to create a dataframe (and save it as a csv file) from the "all_models" folder identifying the files included in its subfolders by GMACS file type
  - "getFileType.R": defines a function that identifies the GMACS file type of each file in a subfolder 
* the following csv files:
  - "models-all.csv": summarizes the files in the model subfolders under "all_models" (files classified as GMACS "unknown" type are not included)
  - "models-for_testing.csv": identifies the model subfolders to use when testing GMACS during code development
  - "models-latest_assessment.csv": identifies the model subfolders used in the latest assessment
  
## Updates

Assessment authors should clone this repo and:

* add additional subfolders under the "all_models" folders as desired (at least a subfolder with the latest assessment model files should be added)
* source "getModelPaths.R" and run it to update "models-all.csv"
* update "models-latest_assessment.csv" to identify the new subfolder with the latest assessment
* optional (although recommended): add new subfolders to "models-for_testing.csv"

and then push (or submit a pull request) to update the repo.

