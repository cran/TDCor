\name{shortest.path}
\alias{shortest.path}
\title{
Calculate the shortest path linking every pairs of nodes in the network
}
\description{
\code{shortest.path} computes the shortest influence path (in number of edges) linking every possible regulator/target pairs in the network. 
}
\usage{
shortest.path(bootstrap, BS_thr)
}
\arguments{
  \item{bootstrap}{
A square numerical matrix representing a network. The element [i,j] of this matrix is the signed bootstrap value for the edge 'gene j to gene i'. The sign of this element indicates the sign of the predicted interation (i.e. whether it is inhibitory or stimulatory) and the absolute value of the element is the bootstrap.
}
  \item{BS_thr}{
Minimum bootstrap threshold for an edge to be taken into consideration in the analysis. The edges with bootstrap values below this threshold are ignored.
}
}
\details{
The paths are signed in order to keep track of the type of influence that the genes have on each other. If a path leads to the inhibition of a gene by another,
\code{shortest.path} will return a negative number for this "pair" (Note that the (i,j) pair is not regarded as being the same than the (j,i) pair). Because the network is directed, edges can only be followed in one direction: from the regulator to the target. Hence if the network contains an edge
from gene i to gene j, the length of the shortest path from i to j is 1 edge and therefore the function returns either 1 or -1  (depending on the sign of the interaction) for the length of i to j path. In absence of feedback loops between i and j, the network does not contain any path from gene j to gene i. In this case \code{shortest.path} shall return 0 for the length of the j to i path. Otherwise it will return the minimum number of edges to follow to go from j to i.
}
\value{
\code{shortest.path} returns a list containing two matrices.

\item{SP}{ A square numerical matrix. The element [i,j] stores the signed shortest path from gene j to gene i. The sign indicates of the type of regulatory influence (stimulatory or inhitory) that gene j has on gene i through the shortest path.}
\item{BS}{A square numerical matrix. The element [i,j] stores the geometric mean of the bootstrap values of the edges located on the shortest path from gene j to gene i.}
}
\author{
Julien Lavenus \email{jl.tdcor@gmail.com}
}

\examples{


## Example with a 3-genes network where gene A upregulates B which upregulates A; and C represses B.
## the three edges have different bootstrap values (100, 60 and 55)

network=data.frame(matrix(c(0,100,0,0,60,0,0,-55,0),3,3))
names(network)=c("gene A","gene B","gene C")
rownames(network)=c("gene A","gene B","gene C")

shortest.path(as.matrix(network),1)

}
\keyword{Side functions}
