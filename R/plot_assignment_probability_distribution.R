#' Plot assignment probability distribution
#'
#' Given a data frame of classification probabilities, this function produces a
#' histogram of the probability of invalid responses and displays the number of
#' responses with probabilities exceeding a given cutoff.
#'
#' @param probs A data frame containing classification probabilities. The data
#'   frame must have two columns, one containing probabilities of the valid
#'   response class and one containing probabilities of the invalid response
#'   class.
#' @param cutoff An optional scalar indicating the probability cutoff above
#'   which to calculate the proportion of responses. Default value is 0.9.
#' @return A histogram of the probability of invalid response class assignment
#'   and a plot of the number of responses with probabilities exceeding the
#'   given cutoff (default = 0.9).
#' @examples
#' probs = data.frame(valid = runif(100))
#' probs$invalid = 1-probs$valid
#' plot_assignment_probability_distribution(probs)
#' @export
#' @importFrom graphics hist plot abline text
plot_assignment_probability_distribution = function (probs, cutoff = 0.9) {
  h = hist(probs$invalid,
           xlab = "Prob. invalid",
           main = "",
           breaks = 20)
  plot(x = 0,
       type = "n",
       xlim = c(0, 1),
       ylim = range(h$counts),
       xlab = "Pr(invalid)",
       ylab = "N Responses",
       main = "")
  abline(h = seq(from = 0, to = nrow(probs), by = 50), lwd = 1/4, col = "gray")
  plot(h, add = TRUE)
  if (!is.null(cutoff)) {
    abline(v = cutoff, col = "red", lty = 2)
    nexcl = sum(probs$invalid > cutoff)
    n = nrow(probs)
    pct = (nexcl/n)*100
    cutoff_str = paste0(nexcl, " of ", n, " responses (", pct, "%) above cutoff of ", cutoff)
    graphics::text(x = cutoff,
                   y = max(h$counts),
                   labels = cutoff_str,
                   pos = 2,
                   col = "red")
  }
}
