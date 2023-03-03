#' Specify residual variances for observed variables in factor mixture modeling
#'
#' This function creates a path object in OpenMx, specifying freely estimated
#' residual variances for observed variables in a factor mixture model.
#'
#' @param ov A character vector of observed variable names.
#'
#' @return A path (variance) object in OpenMx.
#'
#' @examples
#' # Create a residual variance of 1 for "y1", "y2", and "y3"
#' specify_observed_variances(c("y1", "y2", "y3"))
#'
#' @importFrom OpenMx mxPath
#' @export
specify_observed_variances = function (ov) {
  ov_var = OpenMx::mxPath(from = ov,
                          to = ov,
                          arrows = 2,
                          free = TRUE,
                          values = 0.8)
  return(ov_var)
}
