#' Estimate the factor mixture model
#'
#' This function estimates the specified factor mixture model using OpenMx's
#' \code{mxRun} function.
#'
#' @param model An OpenMx model object that represents the factor mixture model
#'   constructed using \code{specify_model}.
#' @param warn Logical indicating whether to suppress warning messages during
#'   model fitting (default = FALSE).
#' @param ... Additional arguments passed to \code{mxRun}.
#'
#' @return An OpenMx fit object containing the estimated model.
#'
#' @import OpenMx
#'
#' @export
estimate_model = function (model, warn = FALSE, ...) {
  fit = OpenMx::mxRun(model, suppressWarnings = warn, ...)
  return(fit)
}
