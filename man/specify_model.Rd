% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/specify_model.R
\name{specify_model}
\alias{specify_model}
\title{Define a factor mixture model}
\usage{
specify_model(data, class_def, fit_fun = NULL)
}
\arguments{
\item{data}{A data frame or matrix containing observed variable data.}

\item{class_def}{A list with two elements, "valid" and "invalid", containing
the class definitions for the valid and invalid classes, respectively. The
class definitions should be created using the \code{\link{specify_classes}}
function.}

\item{fit_fun}{An optional argument specifying the fitting function to be
used. Defaults to maximum likelihood estimation using the
\code{\link{mxFitFunctionML}} function.}
}
\value{
An OpenMx model object.
}
\description{
This function defines a factor mixture model with two latent classes,
representing valid and invalid responses, using the specified class
definitions and data.
}
