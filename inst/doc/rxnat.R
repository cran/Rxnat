## ----setup, include = FALSE----------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)
library(Rxnat)

## ---- eval = FALSE-------------------------------------------------------
#  # install.packages("devtools")
#  devtools::install_github("adigherman/Rxnat")

## ---- eval = FALSE-------------------------------------------------------
#  nitrc <- xnat_connect('https://nitrc.org/ir', username='XXXX', password='YYYY', xnat_name=NULL)

## ---- eval = FALSE-------------------------------------------------------
#  nitrc <- xnat_connect('https://nitrc.org/ir', xnat_name='NITRC')

## ------------------------------------------------------------------------
nitrc <- xnat_connect('https://nitrc.org/ir')

## ------------------------------------------------------------------------
nitrc_projects <- nitrc$projects()
head(nitrc_projects[c('ID','name')])

## ------------------------------------------------------------------------
nitrc_subjects <- nitrc$subjects()
head(nitrc_subjects)

## ------------------------------------------------------------------------
nitrc_experiments <- nitrc$experiments()
head(nitrc_experiments)

## ------------------------------------------------------------------------
xnat_E00026_resources <- nitrc$get_xnat_experiment_resources('xnat_E00026')
head(xnat_E00026_resources[c('Name','URI')])

## ------------------------------------------------------------------------
nitrc_age_26 <- query_scan_resources(nitrc,age='26')
head(nitrc_age_26[c("subject_ID","experiment_ID", "Project", "Age")])

## ---- eval = FALSE-------------------------------------------------------
#  scan_resources <- get_scan_resources(nitrc,'xnat_E00026')
#  scan_resources[1,c("Name","URI")]

## ---- eval = FALSE-------------------------------------------------------
#  > download_xnat_file(nitrc,"/data/experiments/xnat_E00026/scans/anat_mprage_anonymized/resources/3967/files/scan_mprage_anonymized.nii.gz", file_dir = tempdir())
#  [1] "/var/folders/kr/05bm5krj0r3fpwxfdmx4xthm0000gn/T//RtmpTNSN5E/scan_mprage_anonymized.nii.gz"

## ---- eval = FALSE-------------------------------------------------------
#  download_xnat_dir(nitrc, experiment_ID='NITRC_IR_E10507',scan_type='T2', file_dir = tempdir(), verbose=TRUE)
#  /var/folders/kr/05bm5krj0r3fpwxfdmx4xthm0000gn/T//RtmpTNSN5E/NITRC_IR_E10507.zip
#  Downloading: 5.2 MB     [1] "/var/folders/kr/05bm5krj0r3fpwxfdmx4xthm0000gn/T//RtmpTNSN5E/NITRC_IR_E10507.zip"

