#' Check pairwise correlations in a data frame
#'
#' This function checks whether all pairwise correlations between variables in a
#' data frame are positive.
#'
#' @param x A data frame containing variables for which to compute correlations.
#' @return A message indicating whether all pairwise correlations are positive.
#' @export
#' @importFrom stats cor
check_cor = function (x) {
  r = stats::cor(x, use = "pairwise.complete.obs")
  message("Checking correlations")
  if (all(r[lower.tri(r)] > 0)) {
    message("All pairwise correlations posisive")
  } else {
    warning("Some pairwise correlations are negative. Ensure reverse-coded items have been reverse-coded")
  }
}
