#' TickAtLab_pedigree
#' 
#' A convenience function for easily converting a TickAtLab table into a \link[kinship2:pedigree]{kinship2:pedigree}.
#' 
#' @param df A data.frame containing pedigree information. It should include columns for 'Tier.ID1', 'Vater', 'Mutter', 'G', and 'IsDead' by default. You can change the column names by specifying the 'defining.colnames' argument.
#' @param defining.colnames A list specifying the column names for 'id', 'dadid', 'momid', 'sex', and 'status' in the input data.frame. The default values correspond to the most commonly used column names.
#' @param affected additional column names from data frame or either of: "Task", short for "HasTask","HadTask"; "Tasks", short for "HasTask","HadTask","ParticipatesInActiveMating"; NULL, indicating affection status. All columns need to contain data convertible into logical
#' @inherit kinship2::pedigree return 
#' @details The function ensures that the input data.frame is converted to the correct format expected by the kinship2 package. It checks and converts specific columns to the required data types ('id', 'dadid', 'momid' to character and 'status' to numeric). It also checks that the 'sex' column only contains the values 'm' (male) and/or 'f' (female).
#' @examples
#' # Sample data.frame containing pedigree information
#' my_df <- data.frame(
#'   Tier.ID1 = c("Ind1", "Ind2", "Ind3"),
#'   Vater = c("V1", NA, "V1"),
#'   Mutter = c("M1", NA, "M2"),
#'   G = c("m", "f", "f"),
#'   IsDead = c(0, 1, 0)
#' )
#' # Convert data.frame to pedigree object
#' pedigree_obj <- TickAtLab_pedigree(df = my_df)
#' @importFrom kinship2 pedigree
#' @author Moritz Lindner
#' @export
TickAtLab_pedigree <- function(df,
                               defining.colnames = list(
                                 id = "Tier.ID1",
                                 dadid = "Vater",
                                 momid = "Mutter",
                                 sex = "G",
                                 status = "IsDead"
                               ),
                               features = NULL){
  
  if (!("data.frame" %in% class(df))) {
    stop("'df' is not of class 'data.frame'.")
  }
  
  tmp<-make.names(colnames(df))
  if (!all(tmp==colnames(df))){
    warning("Complex column names detected. Consider using 'make.names(colnames(df))' if this function fails")
  }
  
  for (i in names(defining.colnames)) {
    if (defining.colnames[[i]] %in% colnames(df)) {
      colnames(df)[colnames(df) == defining.colnames[[i]]] <- i
    } else{
      stop("'", defining.colnames[[i]], "' is not a valid column name of 'df'.")
    }
  }
  
  charcols <- c("id", "dadid", "momid","sex")
  for (i in charcols) {
    if (!("character" %in% class(df[[i]]))) {
      tryCatch(
        df[[i]] <- as.character(df[[i]]),
        finally = warning("'", defining.colnames[[i]], "' was converted into 'character'."),
        error = function(e) {
          stop("'",
               defining.colnames[[i]],
               "' could not be converted into 'character'.")
        }
      )
    }
  }
  
  numcols <- c("status")
  for (i in numcols) {
    if (!("numeric" %in% class(df[[i]]))) {
      tryCatch(
        df[[i]] <- as.numeric(df[[i]]),
        finally = warning("'", defining.colnames[[i]], "' was converted into 'numeric'."),
        error = function(e) {
          stop("'",
               defining.colnames[[i]],
               "' could not be converted into 'numeric'.")
        }
      )
    }
  }
  
  if (!(all(unique(df$sex) %in% c("m", "f")))) {
    stop("'",defining.colnames$sex, "' should only contain the values 'm' and/or 'f'.")
  }
  
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
  
  tr <- pedigree(
    id = df$id,
    dadid = df$dadid,
    momid = df$momid,
    sex = df$sex,
    affected = if (is.null(features)) {
      rep(F, length(df$dadid))
    } else{
      as.matrix(df[, features])
    },
    status = df$status,
    missid = ""
  )
  return(tr)
}
