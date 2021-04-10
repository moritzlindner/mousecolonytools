#' TickAtLab_SplitGenotype
#' 
#' Subsets a "Tick@Lab format" data.frame by line name.
#' 
#' @inheritParams TickAtLab_Update
#' @return A data frame containing animal colony information. One row per animal. Per genotype information stored, contains one column (named by the gene) soring the genotype information.
#' @details FIXME: This function currently works with only one relevant gene.
#' @export
TickAtLab_SplitGenotype<-function(df){
  # out<-cbind(stringr::str_split_fixed(df$Genotyp,": ",2)[,1],
  #            stringr::str_split_fixed(stringr::str_split_fixed(df$Genotyp,": ",2)[,2],"/",2))
  out<-stringr::str_split_fixed(df$Genotyp,": ",2)
  #colnames(out)<-c("Gene","Allele1","Allele2")
  colnames(out)<-c("Gene","Alleles")
  out<-as.data.frame(out)
  out$Alleles[out$Alleles==""]<-"ND"
  out$Alleles<-as.factor(out$Alleles)
  colnames(out)[colnames(out)=="Alleles"]<-unique(out$Gene)[unique(out$Gene)!=""]
  out$Gene<-NULL
  # out$Allele1[out$Allele1==""]<-NA
  # # out$Allele2[out$Allele2==""]<-NA
  # out$Allele1<-out$Allele1=="+"
  # # out$Allele2<-out$Allele2=="+"
  # out$Allele1<-as.logical(out$Allele1)
  # out$Allele2<-as.logical(out$Allele2)
  cbind(df,out)
}
