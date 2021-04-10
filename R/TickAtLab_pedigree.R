#' TickAtLab_pedigree
#' 
#' A convenience function for easily converting a TickAtLab table into a \link{kinship2::pedigree}.
#' 
#' @param df data.frame containing pedigree information as exported from tick(at)lab
#' @param features column names from data frame or either of: "Task", short for "HasTask","HadTask"; "Tasks", short for "HasTask","HadTask","ParticipatesInActiveMating"; NULL. All columns need to contain data convertible into logical
#' @inherit kinship2::pedigree return 
#' @export
TickAtLab_pedigree<-function(df,features=NULL){
  
  if (!is.null(features)){
    if(length(features)==1){
      if(features=="Task"){
        features<-c("HasTask","HadTask")
      }
      if(features=="Tasks"){
        features<-c("HasTask","HadTask","ParticipatesInActiveMating")
      }
    }
  }
  tr<-pedigree(id=df$`Tier-ID1`,
               dadid=df$Vater,
               momid=df$Mutter,
               sex=df$G,
               affected = if(is.null(features)){rep(F,length(df$Vater))}else{as.matrix(df[,features])},
               status=as.numeric(df$IsDead),
               missid="")
  return(tr)
}
