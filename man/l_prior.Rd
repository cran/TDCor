\name{l_prior}
\alias{l_prior}
\docType{data}
\title{
l_prior
}
\description{
Vector containing the prior associated with the genes included in the network reconstruction in Lavenus et al. 2015, Plant Cell.\cr

By defining the \code{l_prior} vector, the user defines which genes should be regarded as positive regulators, which others as negative regulators and which can only be targets. The prior code is defined as follow: -1 for negative regulator; 0 for non-regulator (target only); 1 for positive regulator; 2 for both positive and negative regulator. The i-th element of the vector is the prior to associate to the i-th gene in \code{l_genes}.

}

\usage{data("l_prior")}

\examples{
# Load the vector
data(l_prior)

# Have a look at it
l_prior
}
\keyword{datasets}
