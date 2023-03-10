% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/specify_valid_loadings.R
\name{specify_valid_loadings}
\alias{specify_valid_loadings}
\title{Specify factor loadings for valid response group in factor mixture model}
\usage{
specify_valid_loadings(ov, valid_key = NULL, lv = "G", ...)
}
\arguments{
\item{ov}{A character vector of observed variable names for the valid
response group.}

\item{valid_key}{A vector of numeric values specifying the factor loadings
for the valid response group If \code{NULL} (default), the loadings are
fixed to 1 for all observed variables in \code{ov}.}

\item{lv}{The name of the latent variable for the valid response group.
Defaults to "G".}

\item{...}{Additional arguments passed to \code{\link{mxPath}}.}
}
\value{
A path (factor loading) object in OpenMx.
}
\description{
This function creates a path object in OpenMx, specifying factor loadings for
the valid response group in a factor mixture model. The factor loadings are
fixed to the values specified by the \code{valid_key} argument. Note that
this defaults to assuming prior reverse-coding of reversed items (i.e., that
all items will have positive loadings in the valid response group).
}
\examples{
# Create a factor with loadings of 1 for "y1", "y2", and "y3"
specify_valid_loadings(c("y1", "y2", "y3"), valid_key = c(1, 1, 1))

}
