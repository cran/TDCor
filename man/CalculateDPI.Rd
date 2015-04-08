\name{CalculateDPI}
\alias{CalculateDPI}
\title{Generate the DPI database to be used by the TDCOR main function}
\description{
\code{CalculateDPI} builds a DPI database for the TDCOR main function to prune diamond motifs
}
\usage{
CalculateDPI(dataset,l_genes, l_prior, times, time_step, N, ks_int, kd_int, 
delta_int, noise, delay)
}
\arguments{
  \item{dataset}{
Numerical matrix storing the transcriptomic data. The rows of this matrix must be named by gene codes (like AGI gene codes for Arabidopsis data).
}
  \item{l_genes}{
A character vector containing the gene codes of the genes included in the analysis (i.e. to be used to build the network)
}
  \item{l_prior}{
A numerical vector containing the prior information on the genes included in the network recontruction. By defining the \code{l_prior} vector, the user defines which genes should be regarded as positive regulators, which others as negative regulators and which can only be targets. The prior code is defined as follow: -1 for negative regulator; 0 for non-regulator (target only); 1 for positive regulator; 2 for both positive and negative regulator. The i-th element of the vector is the prior to associate to the i-th gene in \code{l_genes}.
}
  \item{times}{
A numerical vector containing the successive times at which the samples were collected to generate the time-series transcriptomic dataset.
}
  \item{time_step}{
A positive number corresponding to the time step (in hours) i.e. the temporal resolution at which the gene profiles are analysed. 
}
  \item{N}{
An integer corresponding to the number of iterations that are carried out in order to estimate the DPI distributions. \code{N} should be >5000.
}
  \item{ks_int}{
A numerical vector containing two positive elements in increasing order. The first (second) element is the lower (upper) boundary of the interval into which the equation parameters corresponding to the regulation strength of the targets by their regulators are randomly sampled.
}
  \item{kd_int}{
A numerical vector containing two positive elements in increasing order. The first (second) element is the lower (upper) boundary of the interval into which the equation parameters corresponding to the transcripts degradation rates
are randomly sampled.
}
  \item{delta_int}{
A numerical vector containing two positive elements in increasing order and expressed in hours. The first (second) element is the lower (upper) boundary of the sampling interval for the equation parameters corresponding to the time needed for the transcripts of the regulator to mature, to get exported out of the nucleus, to get translated and for the regulator protein to get imported into the nucleus and to bind its target promoter.
}
  \item{noise}{
A positive number between 0 and 1 corresponding to the noisiness of the system. (0 = no noise, 1 = very strong noise).  \code{noise} should not be too high (for instance below 0.2).
}
  \item{delay}{
A positive number corresponding to the time shift (in hours) that is expected between the profile of a regulator and its direct target. This parameter is used to generate a reference target profile from the profile of the regulator and calculate the DPI index.
}
}
\details{
\code{CalculateDPI} models two 4-genes networks showing slightly different topologies. Each network topology is modelled using a specific system of delay differential equations. For all genes listed in \code{l_genes} whose corresponding prior in \code{l_prior} is not null (i.e. the genes that are regarded as transcriptional regulators), the two systems of differential equations are solved \code{N} times with \code{N} different sets of random parameters. The Diamond Pruning Index (DPI) is calculated for all of these \code{2N} networks. From these in silico data the conditional probability distribution of the DPI index given the regulator and the topology can be estimated. The probability distribution of the topology given DPI and the regulator is next calculated using Bayes' theorem and returned by the function. These shall be used when reconstructing the network to prune the "diamond" motifs. \cr

\code{CalculateDPI} returns a list object which works as a database. It not only stores the conditional probability distributions but also all the necessary information for \code{TDCOR} to access the data, and the input parameters. The latter are read by the \code{UpdateDPI} function to update the database.
}
\value{
\code{CalculateDPI} returns a list object.
\item{prob_DPI_ind}{A numerical vector whose elements are named by the vector \code{l_genes}; The element named gene i contains 0 if no probability distribution has been
calculated for this gene (because its prior is 0) or a positive integer if this has been done. This positive integer then correponds to the number of the element in the list 
\code{prob_DPI} that stores the spline functions of the calculated conditional probability distributions associated with this particular regulator.}
\item{prob_DPI}{A list storing lists of 3 spline functions of probability distributions. Each of the spline functions corresponds to the probability distribution of one topology given a regulator and a DPI value. The information about which regulator was used to generate the distributions stored in the i-th element of \code{prob_DPI} is stored in the \code{prob_DPI_ind} vector.}
\item{prob_DPI_domain}{A list storing vectors of two elements. The first (second) element of element i is the lowest (greatest) DPI value obtained during the simulation with the regulator i.}
\item{input}{A list that stores the input parameters used to generate the database.}
}
\author{
Julien Lavenus \email{jl.tdcor@gmail.com}
}
\note{
The computation of the TPI and DPI databases is time-consuming as it requires many systems of differential equations to be solved. It may take several hours to build a database for a hundred genes.
}

\seealso{
See also \code{\link{UpdateDPI}}, \code{\link{TDCor-package}}.
}
\examples{

\dontrun{
# Load the LR transcriptomic dataset
data(LR_dataset)

# Load the vector of gene codes, gene names and prior
data(l_genes)
data(l_names)
data(l_prior)

# Load the vector of time points for the LR_dataset
data(times)

# Generate a small DPI database (3 genes)
DPI_example=CalculateDPI(dataset=LR_dataset,l_genes=l_genes[4:6],l_prior=l_prior[4:6],
times=times,time_step=1,N=5000,ks_int=c(0.5,3),kd_int=c(0.5,3),delta_int=c(0.5,3),
noise=0.15,delay=3)

}
}
\keyword{Main functions}

