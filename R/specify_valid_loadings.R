#' Specify factor loadings for valid response group in factor mixture model
#'
#' This function creates a path object in OpenMx, specifying factor loadings for
#' the valid response group in a factor mixture model. The factor loadings are
#' fixed to the values specified by the \code{valid_key} argument. Note that
#' this defaults to assuming prior reverse-coding of reversed items (i.e., that
#' all items will have positive loadings in the valid response group).
#'
#' @param ov A character vector of observed variable names for the valid
#'   response group.
#' @param valid_key A vector of numeric values specifying the factor loadings
#'   for the valid response group If \code{NULL} (default), the loadings are
#'   fixed to 1 for all observed variables in \code{ov}.
#' @param lv The name of the latent variable for the valid response group.
#'   Defaults to "G".
#' @param ... Additional arguments passed to \code{\link{mxPath}}.
#'
#' @return A path (factor loading) object in OpenMx.
#'
#' @examples
#' # Create a factor with loadings of 1 for "y1", "y2", and "y3"
#' specify_valid_loadings(c("y1", "y2", "y3"), valid_key = c(1, 1, 1))
#'
#' @importFrom OpenMx mxPath
#' @export
specify_valid_loadings = function (ov, valid_key = NULL, lv = "G", ...) {
  check_observed(ov)
  if (is.null(valid_key)) {
    valid_key = rep(1, length(ov))
  }
  loadings = specify_loadings(ov = ov, key = valid_key, lv = lv, ...)
  return(loadings)
}

