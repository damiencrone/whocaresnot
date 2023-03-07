#' Estimate the factor mixture model
#'
#' This function estimates the specified factor mixture model using OpenMx's
#' \code{mxRun} function.
#'
#' @param model An OpenMx model object that represents the factor mixture model
#'   constructed using \code{specify_model}.
#' @param try_hard Logical indicating whether to use \code{mxTryHard} instead of
#'   \code{mxRun} for model estimation (default = TRUE).
#' @param extra_tries The number of additional tries for \code{mxTryHard} to try
#' to find an acceptable solution (default = 50).
#' @param warn Logical indicating whether to suppress warning messages during
#'   model fitting (default = FALSE).
#' @param ... Additional arguments passed to \code{mxRun}.
#'
#' @return An OpenMx fit object containing the estimated model.
#'
#' @import OpenMx
#' @importFrom OpenMx mxRun mxTryHard imxReportProgress
#'
#' @export
estimate_model = function (model, try_hard = TRUE, extra_tries = 50, warn = FALSE, ...) {
  if (try_hard) {
    fit = OpenMx::mxTryHard(model, extraTries = extra_tries)
  } else {
    fit = OpenMx::mxRun(model, suppressWarnings = warn, ...)
  }
  return(fit)
}
