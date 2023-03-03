#' Check if a vector contains valid keys for specifying invalid response group factor loadings
#'
#' This function checks if a numeric vector contains valid keys for specifying
#' factor loadings for an invalid response group in a factor mixture model.
#' Specifically, the vector must contain both positive and negative values.
#'
#' @param x A numeric vector to be checked.
#'
#' @return Returns \code{NULL} if the vector contains both positive and negative
#' values. Otherwise, raises an error.
check_invalid_key = function (x) {
  if (!is.numeric(x)) {
    stop("Numeric vector required.")
  }
  if (!all(c(-1, 1) %in% sign(x))) {
    stop("Both positively and negatively coded indicators expected.")
  }
}
