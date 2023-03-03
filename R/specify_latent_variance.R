#' Specify the variance of a latent variable in a factor mixture model
#'
#' This function creates an OpenMx path object, specifying the variance of a
#' latent variable in a factor mixture model. The variance is fixed to the value
#' specified by the \code{x} argument.
#'
#' @param x A numeric value specifying the variance of the latent variable.
#' Defaults to 1.
#' @param lv The name of the latent variable for which to specify the variance.
#' Defaults to "G".
#'
#' @return A path (variance) object in OpenMx.
#'
#' @examples
#' # Create a variance of 0.5 for the latent variable "G"
#' specify_latent_variance(x = 0.5, lv = "G")
#'
#' @importFrom OpenMx mxPath
#' @export
specify_latent_variance = function (x = 1, lv = "G") {
  lv_var = OpenMx::mxPath(from = lv,
                          to = lv,
                          arrows = 2,
                          free = TRUE,
                          values = x)
  return(lv_var)
}
