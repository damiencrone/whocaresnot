#' Plot decision threshold
#'
#' Given a data frame of classification probabilities, this function produces a
#' plot of decision thresholds.
#'
#' @param probs A data frame containing classification probabilities. The data
#'   frame must have two columns, one containing probabilities of the valid
#'   class and one containing probabilities of the invalid class.
#' @return A plot of decision thresholds.
#' @examples
#' probs <- data.frame(valid = runif(100), invalid = runif(100))
#' plot_decision_threshold(probs)
#' @export
#' @importFrom graphics plot abline axis box lines
plot_decision_threshold = function (probs) {
  thresh = (0:100)/100
  prop_valid = sapply(X = thresh,
                      probs = probs,
                      FUN = function(x, probs) mean(probs$invalid < x))
  plot(x = 0,
       type = "n",
       xlim = c(0, 1),
       ylim = c(0, 1),
       axes = FALSE,
       xlab = "Retention rate (proportion of sample categorized as valid)",
       ylab = "Decision threshold (retain if < Pr(invalid))")
  abline(v = (0:10)/10, h = (0:10)/10, lwd = 1/4, col = "gray")
  abline(v = 0.5, h = 0.5, lwd = 3/4, col = "gray")
  axis(side = 1)
  axis(side = 2)
  box()
  lines(x = prop_valid,
        y = thresh)
}
