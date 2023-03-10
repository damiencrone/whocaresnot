% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/get_responses.R
\name{get_responses}
\alias{get_responses}
\title{Get item responses sorted by probability of response being invalid}
\usage{
get_responses(data, probs)
}
\arguments{
\item{data}{A data frame containing item responses.}

\item{probs}{A data frame containing classification probabilities. The data
frame must have two columns, one containing probabilities of the valid
class and one containing probabilities of the invalid class.}
}
\value{
A data frame containing the sorted item responses and their
corresponding probabilities of being classified as invalid.
}
\description{
Given a data frame of item responses and a data frame of classification
probabilities, this function returns the item responses sorted by
probability of response being invalid (in decreasing order).
}
