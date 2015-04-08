\name{draw.profile}
\alias{draw.profile}
\title{
Plot the expression profile of a \code{gene} in \code{dataset}
}
\description{
\code{draw.profile} plots the expression profile of \code{gene} in \code{dataset} with respect to \code{times}.
}
\usage{
draw.profile(dataset, gene, ...)
}
\arguments{
  \item{dataset}{
The matrix storing the time-serie transcriptomic data.
}
  \item{gene}{
The AGI code of the gene of interest.
}
  \item{...}{
Additional arguments to be passed to the function:
\itemize{
\item{\code{col}: String. Color of the curve.}
\item{\code{type}: String. Type of curve. "l", lines; "p", points; "b", both etc... For more information see the help file of the \code{plot} R function.}
\item{\code{main}: String. Title of the graph.}
}
}
}
\author{
Julien Lavenus (\email{jl.tdcor@gmail.com})
}

\examples{
# draw the profile of GATA23 in the LR dataset

data(LR_dataset)
data(times)
draw.profile(LR_dataset,"AT5G26930",col="blue",main="GATA23")
}

\keyword{Side functions}
