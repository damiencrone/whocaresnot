#' Specify factor loadings for invalid response group in factor mixture model
#'
#' This function creates an OpenMx path object, specifying factor loadings for
#' the invalid response group in a factor mixture model. The factor loadings are
#' fixed to the values specified by the \code{invalid_key} argument.
#'
#' @param ov A character vector of observed variable names for the invalid
#'   response group.
#' @param invalid_key A vector of numeric values specifying the factor loadings
#'   reverse-coded items in the invalid response group. The vector must contain
#'   positive and negative values (e.g., \code{c(1, -1, 1, -1)}).
#' @param lv The name of the latent variable for the invalid response group.
#'   Defaults to "G".
#' @param ... Additional arguments passed to \code{\link{mxPath}}.
#'
#' @return A path (factor loading) object in OpenMx.
#'
#' @examples
#' # Create a factor with loadings of c(1, -1, 1, -1) for "y4", "y5", "y6", and "y7"
#' specify_invalid_loadings(c("y4", "y5", "y6", "y7"), invalid_key = c(1, -1, 1, -1))
#'
#' @importFrom OpenMx mxPath
#' @export
specify_invalid_loadings = function (ov, invalid_key, lv = "G", ...) {
  check_observed(ov)
  check_invalid_key(invalid_key)
  loadings = specify_loadings(ov = ov, key = invalid_key, lv = lv, ...)
  return(loadings)
}
