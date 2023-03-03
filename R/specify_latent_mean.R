#' Specify the mean of a latent variable in factor mixture modeling
#'
#' This function creates a path object in OpenMx, specifying the mean of a latent
#' variable in a factor mixture model. The mean is fixed to the value specified
#' by the \code{x} argument.
#'
#' @param x A numeric value specifying the mean of the latent variable. Defaults
#' to 0.
#' @param lv The name of the latent variable. Defaults to "G".
#' @param ... Additional arguments passed to \code{\link{mxPath}}.
#'
#' @return A path object in OpenMx.
#'
#' @examples
#' # Create a factor with a mean of 1 for "G"
#' specify_latent_mean(x = 1, lv = "G")
#'
#' @importFrom OpenMx mxPath
#' @export
specify_latent_mean = function (x = 0, lv = "G", ...) {
  if (lv == "one") stop("Impermissible lv name.")
  lv_mean = OpenMx::mxPath(from = "one",
                           to = lv,
                           arrows = 1,
                           free = FALSE,
                           values = x,
                           ...)
  return(lv_mean)
}
