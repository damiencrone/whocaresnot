#' Define the valid and invalid response classes in the carelessness factor
#' mixture model.
#'
#' @param ov A character vector of observed variable names.
#' @param valid_loadings An OpenMx path object specifying the valid group's
#'   factor loadings.
#' @param valid_latent_variance An OpenMx path object specifying the valid
#'   group's latent variable variance.
#' @param invalid_loadings An OpenMx path object specifying the invalid group's
#'   factor loadings.
#' @param invalid_latent_variance An OpenMx path object specifying the invalid
#'   group's latent variable variance.
#' @param latent_means An OpenMx path object specifying the latent variable
#'   means.
#' @param error_var An OpenMx path object specifying the error variances.
#' @param item_int An OpenMx path object specifying the item intercepts.
#' @param fit_fun An OpenMx fit function. Default is NULL, which specifies
#'   maximum likelihood estimation.
#' @param lv A character string indicating the name of the latent variable.
#'   Default is "G".
#'
#' @return A list containing the two class definitions.
#' @importFrom OpenMx mxFitFunctionML mxModel
#' @export
specify_classes = function (ov,
                            valid_loadings,
                            valid_latent_variance,
                            invalid_loadings,
                            invalid_latent_variance,
                            latent_mean,
                            error_var,
                            item_int,
                            fit_fun = NULL,
                            lv = "G") {
  if (is.null(fit_fun)) {
    fit_fun = OpenMx::mxFitFunctionML(vector = TRUE)
  }
  class_def_valid = OpenMx::mxModel("class_valid",
                                    type = "RAM",
                                    manifestVars = ov,
                                    latentVars = lv,
                                    valid_loadings,
                                    valid_latent_variance,
                                    latent_mean,
                                    error_var,
                                    item_int,
                                    fit_fun)
  class_def_invalid = OpenMx::mxModel("class_invalid",
                                      type = "RAM",
                                      manifestVars = ov,
                                      latentVars = lv,
                                      invalid_loadings,
                                      invalid_latent_variance,
                                      latent_mean,
                                      error_var,
                                      item_int,
                                      fit_fun)
  class_def = list(valid = class_def_valid,
                   invalid = class_def_invalid)
  return(class_def)
}
