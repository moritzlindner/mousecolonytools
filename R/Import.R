# 
# rename population.df columns
# population.df$Family<-as.factor(population.df$Family)
# Families<-levels(population.df$Family)
# IDs<-unique(population.df$ID[i])
# 
# 
# if (!(is.numeric(population.df$ID))){
#   stop("'ID' is not a numeric vector.")
# }
# 
# if (!(is.numeric(population.df$Dad.id))){
#   stop("'Dad.ID' is not a numeric vector.")
# }
# 
# if (!(is.numeric(MoM.id))){
#   stop("'Dad.ID' is not a numeric vector")
# }
# 
# if (length(IDs) != length(population.df$ID)) {
#   stop ("Duplicate 'IDs'")
# }
# if (!all(unique(population.df$Dad.ID) %in% c(IDs, NA)) {
#   stop ("At least one 'Dad.ID' is not contained in 'ID's.")
# }
# if (!all(unique(population.df$Mom.ID) %in% c(IDs, NA))) {
#   stop ("At least one 'Mom.ID' is not contained in 'ID's.")
# }
# Individuals <- list()
# for (i in 1:dim(population.df[2]) {
#   Individuals[[population.df$ID[i]]] <- Individual(
#     ID = population.df$ID[i],
#     Name = population.df$Name[i],
#     Family = as.numeric(population.df$Family[i])
#     Dad.id = population.df$Family[i]
#   )
# }