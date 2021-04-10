#' TickAtLab_Import
#' 
#' Imports xls files created by the Tick@lab export function into a data frame. Only keeps animal names and discardes IDs.
#' 
#' @param filename Path to tick@lab xls file.
#' @importFrom rstudioapi selectFile
#' @importFrom readxl read_excel
#' @return A data frame containing animal colony information. One row per animal. 
#' @export
TickAtLab_Import<-function(filename=selectFile(caption = "Select tick@lab XLS File",
                                                    filter = "XLS Files (*.xls)",
                                                    existing = TRUE)){
  ped<-as.data.frame(readxl::read_excel(filename,1))
  ped<-ped[!is.na(ped$`Tier-ID1`),]
  rownames(ped)<-ped$`Tier-ID1`
  ped$Vater<-stringr::str_split_fixed(ped$Vater,"//",3)[,2]
  ped$Mutter<-stringr::str_split_fixed(ped$Mutter,"//",3)[,2]
  return(ped)
}