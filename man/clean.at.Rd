\name{clean.at}
\alias{clean.at}
\title{
Elimininate from a vector of gene codes the genes for which no data is available.
}
\description{
\code{clean.at} removes from a vector of gene codes \code{l_genes} all the elements for which no data is present in the
matrix \code{dataset}.
}
\usage{
clean.at(dataset,l_genes)
}
\arguments{
  \item{dataset}{
A matrix containing the time-series transcriptomic data whose rows must be named by gene codes (like AGI gene codes).
}
  \item{l_genes}{
A character vector which contains gene codes (AGI gene codes in the case of the lateral root dataset).
}
}

\examples{
## Load lateral root transcriptomic dataset and the l_genes vector
data(LR_dataset)
data(l_genes)

# Clean the l_gene vector 
clean.at(LR_dataset,l_genes)

}
\keyword{Side functions}

