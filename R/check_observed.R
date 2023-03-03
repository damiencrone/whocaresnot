#' Check if a vector of observed variables is valid
#'
#' This function checks whether a vector of observed variables is valid for use
#' detecting carelessness. Specifically, it checks whether the input is a
#' character vector with at least two elements.
#'
#' @param x A vector of observed variables to check.
#'
#' @return Nothing; this function is used for its error-checking side effects.
check_observed = function (x) {
  if (!is.character(x)) {
    stop("Chatacter vector required.")
  }
  if (length(x) < 2) {
    stop("At least 2 observed variables required")
  }
}
