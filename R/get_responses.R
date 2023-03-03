#' Get item responses sorted by probability of response being invalid
#'
#' Given a data frame of item responses and a data frame of classification
#' probabilities, this function returns the item responses sorted by
#' probability of response being invalid (in decreasing order).
#'
#' @param data A data frame containing item responses.
#' @param probs A data frame containing classification probabilities. The data
#' frame must have two columns, one containing probabilities of the valid
#' class and one containing probabilities of the invalid class.
#' @return A data frame containing the sorted item responses and their
#' corresponding probabilities of being classified as invalid.
#' @export
get_responses = function (data, probs) {
  row_ind = order(probs$invalid, decreasing = TRUE)
  responses = data.frame(prob_invalid = round(probs$invalid, 3),
                         data)
  responses = responses[row_ind,]
  return(responses)
}
