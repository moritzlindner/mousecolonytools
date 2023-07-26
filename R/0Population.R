#' #' Population Class
#' #'
#' #' A class representing a population with individuals and founder information.
#' #'
#' #' @format A \code{\linkS4class{Class}} object.
#' #' @slot Individuals \code{list}: A list of objects of class \code{\linkS4class{Individual}} representing the individuals in the population.
#' #' @slot Dad.founder \code{character}: The name of the founder (dad).
#' #' @slot Mom.founder \code{character}: The name of the founder (mom).
#' #'
#' #' @details
#' #' The \code{Population} class is used to represent a population consisting of individuals. It contains slots for storing information about the individuals in the population, as well as the names of the founder (dad) and founder (mom).
#' #' The constructor function \code{\link{Population}} is used to create objects of this class.
#' #'
#' #' @seealso
#' #' \code{\linkS4class{Class}},
#' #' \code{\link{setClass}},
#' #' \code{\link{new}},
#' #' \code{\link{Individual}}
#' #'
#' #' @name Population
#' #' @exportClass Population
#' setClass("Population",
#'          slots = c(
#'            Individuals = "list",  # List of objects of class Individual
#'            Dad.founder = "character",
#'            Mom.founder = "character"
#'          ),
#'          prototype = list(
#'            Individuals = list(),
#'            Dad.founder = NA,
#'            Mom.founder = NA
#'          ),
#'          validity = validObject.Population)
#' 
#' 
#' # Create the constructor function for 'Population'
#' Population <- function(Individuals = list(), Dad.founder, Mom.founder) {
#'   # Check if Individuals contains only objects of class Individual
#'   if (!all(sapply(Individuals, function(x) inherits(x, "Individual")))) {
#'     stop("The 'Individuals' slot must contain only objects of class 'Individual'.")
#'   }
#'   
#'   new("Population",
#'       Individuals = Individuals,
#'       Dad.founder = Dad.founder,
#'       Mom.founder = Mom.founder
#'       # genotype description
#'       # family names
#'   )
#' }
#' 
#' validObject.Population <- function(object) {
#'   # Check if Dad.founder and Mom.founder are not NA
#'   if (is.na(object@Dad.founder) || is.na(object@Mom.founder)) {
#'     return("Both 'Dad.founder' and 'Mom.founder' must be provided.")
#'   }
#'   
#'   # Check if Individuals contains only objects of class Individual
#'   if (!all(sapply(object@Individuals, function(x) inherits(x, "Individual")))) {
#'     return("The 'Individuals' slot must contain only objects of class 'Individual'.")
#'   }
#'   
#'   if(!(object@Dad.founder %in% GetID(object))){
#'     return("The 'Dad.founder' slot must contain an ID of an Individual contained in the 'Individuals' slot.")
#'   }
#'   
#'   if(!(object@Mom.founder %in% GetID(object))){
#'     return("The 'Mom.founder' slot must contain an ID of an Individual contained in the 'Individuals' slot.")
#'   }  
#'   TRUE
#' }
