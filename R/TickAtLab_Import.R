#' TickAtLab_Import
#' 
#' Imports xls files created by the Tick@lab export function into a data frame. Only keeps animal names and discardes IDs.
#' 
#' @param filename Path to tick@lab xls file.
#' @importFrom rstudioapi selectFile
#' @importFrom readxl read_excel
#' @importFrom stringr str_split_fixed
#' @return A data frame containing animal colony information. One row per animal. 
#' @export
TickAtLab_Import<-function(filename=selectFile(caption = "Select tick@lab XLSX File",
                                                    filter = "XLS Files (*.xlsx)",
                                                    existing = TRUE)){
  ped<-as.data.frame(read_excel(filename,1))
  colnames(ped)<-make.names(colnames(ped))
  ped<-ped[!is.na(ped$Tier.ID1),]
  rownames(ped)<-make.names(ped$Tier.ID1)
  ped$Vater<-str_split_fixed(ped$Vater,"//",3)[,2]
  ped$Mutter<-str_split_fixed(ped$Mutter,"//",3)[,2]
  
  if (any(!(unique(ped$Vater) %in% ped$Tier.ID1))){
    missing<-unique(ped$Vater)[!(unique(ped$Vater) %in% ped$Tier.ID1)]
    adddf<-data.frame(ped[0,])
    adddf<-adddf[1:length(missing),]
    adddf$Tier.ID1<-missing
    adddf$G<-"m"
    rownames(adddf)<-adddf$Tier.ID1
    ped <- rbind(ped, adddf)
    warning("Missing male parent IDs added")
  }
  if (any(!(unique(ped$Mutter) %in% ped$Tier.ID1))){
    missing<-unique(ped$Mutter)[!(unique(ped$Mutter) %in% ped$Tier.ID1)]
    missing<-missing[!is.na(missing)]
    adddf<-data.frame(ped[0,])
    adddf<-adddf[1:length(missing),]
    adddf$Tier.ID1<-missing
    adddf$G<-"f"
    rownames(adddf)<-adddf$Tier.ID1
    ped <- rbind(ped, adddf)
    warning("Missing female parent IDs added")
  }
  return(ped)
}