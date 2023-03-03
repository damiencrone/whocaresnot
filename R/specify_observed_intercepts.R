#' Specify intercpts for observed variables in factor mixture modeling
#'
#' This function creates a path object in OpenMx, specifying freely estimated
#' intercpts for observed variables in a factor mixture model.
#'
#' @param ov A character vector of observed variable names.
#' @param ... Additional arguments passed to \code{\link{mxPath}}.
#'
#' @return A path (variance) object in OpenMx.
#'
#' @examples
#' # Create a residual variance of 1 for "y1", "y2", and "y3"
#' specify_observed_intercepts(c("y1", "y2", "y3"))
#'
#' @importFrom OpenMx mxPath
#' @export
specify_observed_intercepts = function (ov, ...) {
  ov_int = OpenMx::mxPath(from = "one",
                          to = ov,
                          arrows = 1,
                          free = TRUE,
                          values = 0.2,
                          ...)
  return(ov_int)
}
