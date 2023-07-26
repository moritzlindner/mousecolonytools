#' #' ------------------
#' #' @describeIn Get Returns the ID of an individual or all individuals in a population.
#' #' @exportMethod GetID
#' setGeneric(
#'   name = "GetID",
#'   def = function(X)
#'   {
#'     standardGeneric("GetSweepNames")
#'   }
#' )
#' 
#' #' @noMd
#' setMethod("GetID",
#'           "Individual",
#'           function(X) {
#'             X@ID
#'           })
#' 
#' #' @noMd
#' setMethod("GetID",
#'           "Population",
#'           function(X) {
#'             lapply(X@Individuals, function(x) {
#'               GetID(x)
#'             })
#'           })