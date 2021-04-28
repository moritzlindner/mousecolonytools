#' TickAtLab_SubsetByFamily
#' 
#' Subsets a "Tick@Lab format" data.frame by line name.
#' 
#' @inheritParams TickAtLab_Update
#' @param Stamm Name of the line to keep.
#' @return A data frame containing animal colony information. One row per animal. 
#' @export
TickAtLab_SubsetByFamily<-function(df,Stamm){
  incl<-unique(c(df$`Tier-ID1`[df$Stamm==Stamm],
                 df$Mutter[df$Stamm==Stamm],
                 df$Vater[df$Stamm==Stamm]))
  incl<-incl[!is.na(incl)]
  incl<-incl[incl!=""]
  df[(df$`Tier-ID1` %in% incl),]
}
