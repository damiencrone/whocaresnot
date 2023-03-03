#' Construct Factor Mixture Model
#'
#' This function constructs an OpenMx factor mixture model to identify careless
#' responses.Note that function defaults to assuming prior reverse-coding of
#' reversed items (i.e., that all items will have positive loadings in the valid
#' response group).
#'
#' @param data A data frame or matrix containing observed variable data.
#' @param ov A character vector of the observed variable names.
#' @param reversed A character vector of reverse coded observed variables that
#'   have already been reverse-coded and will have their loadings reversed in
#'   the invalid class (variables must be a subset of ov).
#' @return Returns an OpenMx factor mixture model object.
#' @export
construct_model = function (data, ov, reversed) {

  invalid_key = rep(1, length(ov))
  invalid_key[ov %in% reversed] = -1

  check_cor(data[, ov])
  if (!all(reversed %in% ov)) {
    stop("All reverse-coded items need to be listed in ov")
  }
  if (!all(ov %in% colnames(data))) {
    stop("ov includes variable names that are not included in data")
  }

  valid_loadings   = specify_valid_loadings(ov)
  invalid_loadings = specify_invalid_loadings(ov, invalid_key)
  valid_latent_variance = specify_latent_variance()
  invalid_latent_variance = specify_latent_variance()
  latent_mean = specify_latent_mean()
  error_var = specify_observed_variances(ov)
  item_int = specify_observed_intercepts(ov)
  class_def = specify_classes(ov,
                              valid_loadings,
                              valid_latent_variance,
                              invalid_loadings,
                              invalid_latent_variance,
                              latent_mean,
                              error_var,
                              item_int)
  model = specify_model(data, class_def)

  return(model)
}
