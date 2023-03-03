#' Get class assignment probabilities from factor mixture model
#'
#' Given a factor mixture model fit object, returns a data frame containing the
#' estimated probabilities of each observation belonging to the valid and
#' invalid response classes.
#'
#' @param fit A factor mixture model fit object obtained from
#'   \code{estimate_model}.
#'
#' @return A data frame with two columns, "valid" and "invalid", containing the
#' estimated probabilities of each observation belonging to the "valid" and "invalid"
#' latent classes, respectively.
#' @export
get_class_assignment_probabilities = function (fit) {
  valid_likelihood   = attr(fit$class_valid$fitfunction, "result")
  invalid_likelihood = attr(fit$class_invalid$fitfunction, "result")
  total_likelikhood  = valid_likelihood + invalid_likelihood
  probs = data.frame(
    valid   = valid_likelihood / total_likelikhood,
    invalid = invalid_likelihood / total_likelikhood
  )
  return(probs)
}
