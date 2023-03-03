#' Specify factor loadings in factor mixture modeling
#'
#' This function creates a path object in OpenMx, specifying factor loadings for
#' a set of observed variables in a factor mixture model. The factor loadings
#' are fixed to the values specified by the \code{key} argument.
#'
#' @param ov A character vector of observed variable names.
#' @param key A vector of numeric values specifying the factor loadings for
#' the observed variables in \code{ov}.
#' @param lv The name of the latent variable for the group of observed variables.
#' Defaults to "G".
#' @param ... Additional arguments passed to \code{\link{mxPath}}.
#'
#' @return A path (factor loading) object in OpenMx.
#'
#' @export
#' @importFrom OpenMx mxPath
specify_loadings = function (ov, key, lv, ...) {
  loadings = OpenMx::mxPath(from = lv,
                            to = ov,
                            arrows = 1,
                            free = FALSE,
                            values = key,
                            ...)
  return(loadings)
}
