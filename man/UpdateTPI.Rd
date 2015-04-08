\name{UpdateTPI}
\alias{UpdateTPI}
\title{
Update or check the TPI database
}
\description{
\code{UpdateTPI} analyzes the TPI database and add new entries into it if it does not contain all the necessary data for reconstructing the network with the genes listed in the vector \code{l_genes}. 
}
\usage{
UpdateTPI(TPI, dataset, l_genes, l_prior)
}
\arguments{
  \item{TPI}{
The TPI database to update or check before reconstructing the network.
}
  \item{dataset}{
Numerical matrix storing the transcriptomic data. The rows of this matrix must be named by gene codes (like AGI gene codes for Arabidopsis data).
}
  \item{l_genes}{
A character vector containing the gene codes of the genes we want to reconstruct the network with.
}
  \item{l_prior}{
A numerical vector containing the prior information on the genes included in the network recontruction. By defining the \code{l_prior} vector, the user defines which genes should be regarded as positive regulators, which others as negative regulators and which can only be targets. The prior code is defined as follow: -1 for negative regulator; 0 for non-regulator (target only); 1 for positive regulator; 2 for both positive and negative regulator. The i-th element of the vector is the prior to associate to the i-th gene in \code{l_genes}.
}
}

\value{
\code{UpdateTPI} returns an updated TPI database containing data for at least all the genes in \code{l_genes} whose
associated prior is not null.
}

\author{
Julien Lavenus \email{jl.tdcor@gmail.com}
}

\seealso{
See also \code{\link{CalculateTPI}}.
}
\examples{
\dontrun{
# Load the Lateral root transcriptomic dataset
data(LR_dataset)

# Load the vector of gene codes, gene names and prior
data(l_genes)
data(l_names)
data(l_prior)

# Load the vector of time points for the LR_dataset
data(times)

# Build a very small TPI database (3 genes)
TPI_example=CalculateTPI(dataset=LR_dataset,l_genes=l_genes[4:6],
l_prior=l_prior[4:6],times=times,time_step=1,N=5000,ks_int=c(0.5,3),
kd_int=c(0.5,3),delta_int=c(0.5,3),noise=0.1,delay=3)

# Add one gene in the database
TPI_example=UpdateTPI(TPI_example,dataset=LR_dataset,l_genes[4:7],l_prior[4:7])
}
}
\keyword{Main functions}
