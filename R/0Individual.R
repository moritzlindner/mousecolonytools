#' validObject.Individual <- function(object) {
#'   # Check if DoB is not after the current date
#'   if (!is.na(object@DoB) && object@DoB > Sys.Date()) {
#'     return("Date of Birth (DoB) cannot be in the future.")
#'   }
#'   
#'   # Check if DoD is not before DoB (if DoD is not NA)
#'   if (!is.na(object@DoD) && !is.na(object@DoB) && object@DoD < object@DoB) {
#'     return("Date of Death (DoD) cannot be before Date of Birth (DoB).")
#'   }
#'   
#'   TRUE
#' }
#' 
#' 
#' #' Individual Class
#' #'
#' #' A class representing an individual with various attributes.
#' #'
#' #' @format A \code{\linkS4class{Class}} object.
#' #' @slot ID \code{numeric}: The ID of the individual.
#' #' @slot Name \code{character}: The name of the individual.
#' #' @slot family \code{numeric}: The family ID or code of the family the individual belongs to.
#' #' @slot Dad.id \code{numeric}: The ID of the individual's father.
#' #' @slot Mom.id \code{numeric}: The ID of the individual's mother.
#' #' @slot DoB \code{Date}: The date of birth of the individual.
#' #' @slot DoD \code{Date}: The date of death of the individual (default is \code{NA} if alive).
#' #' @slot Sex \code{factor}: The sex of the individual. Can be "m" for male or "f" for female.
#' #' @slot Genotype \code{list}: A list representing the individual's genotype.
#' #' @slot Mate.id \code{numeric}: The ID of the individual's mate (default is \code{NA} if not applicable).
#' #' @slot Features \code{list}: A list containing additional features or attributes of the individual.
#' #'
#' #' @details
#' #' The \code{Individual} class is used to represent an individual with various attributes such as ID, name, family ID,
#' #' parents' IDs, date of birth, date of death (if applicable), sex, genotype, mate ID (if applicable), and additional features.
#' #' The constructor function \code{\link{Individual}} is used to create objects of this class.
#' #'
#' #' @examples
#' #' # Create an individual with mandatory slots only
#' #' ind1 <- Individual(ID = 1, Name = "John", family = 123, Dad.id = 10, Mom.id = 20, DoB = as.Date("1990-01-01"), Sex = "m", Genotype = list("AA"))
#' #'
#' #' # Create an individual with optional slots
#' #' ind2 <- Individual(ID = 2, Name = "Jane", family = 123, Dad.id = 10, Mom.id = 20, DoB = as.Date("1992-05-10"), Sex = "f", Genotype = list("CC"),
#' #'                    Mate.id = 3, Features = list(height = 175, weight = 65))
#' #'
#' #' @seealso
#' #' \code{\linkS4class{Class}},
#' #' \code{\link{setClass}},
#' #' \code{\link{validObject}},
#' #' \code{\link{show}},
#' #' \code{\link{new}}
#' #'
#' #' @name Individual
#' #' @exportClass Individual
#' setClass(
#'   "Individual",
#'   slots = c(
#'     ID = "numeric",
#'     Name = "character",
#'     Family = "numeric",
#'     Dad.id = "numeric",
#'     Mom.id = "numeric",
#'     DoB = "Date",
#'     DoD = "Date",
#'     Sex = "factor",
#'     # m or f
#'     Genotype = "list",
#'     Mate.id = "numeric",
#'     Features = "list"
#'   ),
#'   validity = validObject.Individual
#' )
#' 
#' # Create a constructor function for 'Individual'
#' # IndividualPrototype <- new("Individual",
#' #                            ID = NA,
#' #                            Name = NA,
#' #                            family = NA,
#' #                            Dad.id = NA,
#' #                            Mom.id = NA,
#' #                            DoB = as.Date(NA),
#' #                            DoD = as.Date(NA),
#' #                            Sex = factor(levels = c("m", "f"), exclude = NULL),
#' #                            Genotype = list(),
#' #                            Mate.id = NA,
#' #                            Features = list()
#' # )
#' 
#' 
#' Individual <-
#'   function(ID,
#'            Name,
#'            Family,
#'            Dad.id,
#'            Mom.id,
#'            DoB,
#'            DoD = as.Date(NA),
#'            Sex,
#'            Genotype = list(),
#'            Mate.id = as.numeric(NA),
#'            Features = list()) {
#'     # Check if the provided Sex is valid
#'     if (!(Sex %in% c("m", "f"))) {
#'       stop("Invalid 'Sex' value. Use 'm' for male or 'f' for female.")
#'     }
#'     
#'     # Create a new individual instance
#'     new(
#'       "Individual",
#'       ID = ID,
#'       Name = Name,
#'       Family = family,
#'       Dad.id = Dad.id,
#'       Mom.id = Mom.id,
#'       DoB = DoB,
#'       DoD = DoD,
#'       Sex = factor(Sex, levels = c("m", "f")),
#'       Genotype = Genotype,
#'       Mate.id = Mate.id,
#'       Features = Features
#'     )
#'   }
