#' Define a factor mixture model
#'
#' This function defines a factor mixture model with two latent classes,
#' representing valid and invalid responses, using the specified class
#' definitions and data.
#'
#' @param data A data frame or matrix containing observed variable data.
#' @param class_def A list with two elements, "valid" and "invalid", containing
#'   the class definitions for the valid and invalid classes, respectively. The
#'   class definitions should be created using the \code{\link{specify_classes}}
#'   function.
#' @param fit_fun An optional argument specifying the fitting function to be
#'   used. Defaults to maximum likelihood estimation using the
#'   \code{\link{mxFitFunctionML}} function.
#'
#' @return An OpenMx model object.
#' @importFrom OpenMx mxFitFunctionML mxData mxMatrix mxModel mxExpectationMixture
#' @export
specify_model = function (data, class_def, fit_fun = NULL) {
  if(is.null(fit_fun)) {
    fit_fun = OpenMx::mxFitFunctionML()
  }
  mx_dat = OpenMx::mxData(observed = data,
                          type = "raw")
  class_p = OpenMx::mxMatrix(type = "Full",
                             nrow = 2,
                             ncol = 1,
                             free = TRUE,
                             values = c(1, 0),
                             lbound = 0.001,
                             labels = c("p1","p2"),
                             name = "Props")
  mix_exp = OpenMx::mxExpectationMixture(components = c('class_valid', 'class_invalid'),
                                         weights = 'Props',
                                         scale = 'sum')
  model = OpenMx::mxModel("Factor Mixture Model",
                          mx_dat,
                          class_def$valid,
                          class_def$invalid,
                          class_p,
                          mix_exp,
                          fit_fun)
  return(model)
}
