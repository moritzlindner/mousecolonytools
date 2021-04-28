#' TickAtLab_Update
#' 
#' Updates a data.frame in the "Tick@Lab format" with information on new animals. Adds/Updates the "HadTask" column, containing the status of the HasTask column before the updata.
#' 
#' @param df Original data.frame in the "Tick@Lab format"
#' @param df.new Aata.frame in the "Tick@Lab format" containing the new data
#' @return A data frame containing animal colony information. One row per animal. 
#' @export
TickAtLab_Update<-function(df,df.new=TickAtLab_Import()){
  upd<-df.new[rownames(df.new) %in% rownames(df),]
  add<-df.new[!(rownames(df.new) %in% rownames(df)),]
  hadtask<-df[,c("HasTask")]
  df[match(rownames(upd), rownames(df)),] <- upd 
  df$HadTask<-hadtask
  add$HadTask<-FALSE
  rbind(df,add)
}