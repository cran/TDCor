\name{estimate.delay}
\alias{estimate.delay}
\title{
Estimate the time shift between two gene profiles and make a plot
}
\description{
\code{estimate.delay} computes the delay/time shift between two gene expression profiles contained in \code{dataset}. It returns a list with one or two estimated time shifts and their associated correlation. By default the function also returns a plot composed of four panels which show in more details how these estimate were obtained. This can help the user finding the appropriate parameter values to be used with the TDCOR main function. For more details see below. 
}
\usage{
estimate.delay(dataset, tar, reg, times, time_step, thr_cor, tol, 
delaymax, delayspan, ...)
}
\arguments{
  \item{dataset}{
Numerical matrix storing the non-log2 transcriptomic data (average of replicates). The rows of this matrix must be named by gene codes (e.g. the AGI gene code for Arabidopsis datasets). The columns must be organized in chronological order from the left to the right.
}
  \item{tar}{
The gene code of the gene to be regarded as the target.
}
  \item{reg}{
The gene code of the gene to be regarded as the regulator.
}
  \item{times}{ 
A numerical vector containing the successive times (in hours) at which the samples were collected to generate the time-series transcriptomic dataset.
}
  \item{time_step}{
A positive number corresponding to the time step (in hours) i.e. the temporal resolution at which the gene profiles are analysed. 
}
  \item{thr_cor}{ 
A number between 0 and 1 corresponding to the threshold on Pearson's correlation. The delay will be computed only if the absolute correlation between the profiles is higher than this threshold. Otherwise the genes are considered to have profiles that are too dissimilar, and computing the time shift would not make any sense.
}
  \item{tol}{
The tolerance threshold for the score. The score is a positive number used to rank the time shift estimates. The best score possible for a time shift estimate is 0. If the score is above the tolerance threshold, the time shift estimate will be ignored. 
}
  \item{delaymax}{
The maximum time shift possible for a direct interaction (in hours).
}
  \item{delayspan}{ 
The maximum time shift (in hours) which will be analysed. It should be high enough for the time shift estimation process to be successful but relatively small in comparison to the overall duration of the time series. (e.g. for the LR dataset which has data spanning over 54 hours, \code{delayspan} was set to 12 hours).
}
  \item{\dots}{ Additional optional arguments.
\itemize{
\item{\code{make.graph}: A boolean. Set to FALSE to prevent the function from generating a graph.}
\item{\code{tar.name}: A string. "Everyday name" of the target. This name will be used in the plots instead of the default value (gene code).}
\item{\code{reg.name}: A string. "Everyday name" of the regulator. This name will be used in the plots instead of the default value (gene code).}
\item{\code{main}: A string. Main title of the plot. By default the title of the plot is automatically generated from \code{tar.name} and \code{reg.name}.}
}
}
}
\details{
Negative time shifts occur when the gene which the user set as being the regulator could actually be the target. When two time shifts are returned, one is necessarily positive and the other is negative. When the only time shift estimate is zero, the function does not return any estimate.\cr

The function automatically guess the sign of the potential interaction (stimulatory or inhibitory) and adapt the analysis based on it. The sign of the potential interaction is indicated in the main title of the graph by (+) or (-). When both types of interaction are possible, the function generates two graphs (one for each sign).\cr

The function returns by default a graph composed of four panels.  The top panel shows the spline functions of the two normalised expression profiles with respect to time. The second panel consists of the plots of the F1 and F2 functions with respect to the time shift (mu). The third one is for the F3 and F4 functions. All of these four functions aim at estimating the time shift between the two expression profiles by minimizing a distance-like measurement. But they each do it in a slightly different manner. F1 and F3 use Pearson's correlation as a measure of distance while F2 and F4 use the sum of squares. Moreover F1 and F2 measure the distances directly between the spline functions while F3 and F4 do it between the first derivatives of these functions. The vertical red and purple lines in the second and third panel indicate the position of the respective maximum or minimum of the functions. In the fourth and last panel, the final score function is plotted. This score is computed for each  possible time shift analysed by combining the four above-mentionned functions. The green horizontal line indicate the position of the tolerance threshold (\code{tol}) above which time shift estimates are rejected. The vertical dark grey line(s) represent(s) the position of the final estimated time shift(s). All these lines necessarily fall into regions where the score function is below the threshold (painted in light green). Other vertical light grey line(s) may indicate other time shift estimate(s) that have a score above the tolerance threshold and were therefore rejected.
}
\value{
The function returns a list. The first element (delay) is a numerical vector containing the time-shift estimate(s). The second element (correlation) is another numerical vector containing the associated correlation. The function also returns a graph as explained above.
}

\author{
Julien Lavenus \email{jl.tdcor@gmail.com}
}


\examples{
# Load the data

data(LR_dataset)
data(l_genes)
data(l_names)
data(times)

# Estimate the time shift between LBD16 and PUCHI (one time shift estimate returned)

estimate.delay(dataset=LR_dataset, tar=l_genes[which(l_names=="PUCHI")], 
reg=l_genes[which(l_names=="LBD16")], times=times, time_step=1, thr_cor=0.7, 
tol=0.15, delaymax=3, delayspan=12, reg.name="LBD16",tar.name="PUCHI")

# Estimate the time shift between ARF8 and PLT1 (two time shift estimates returned)

estimate.delay(dataset=LR_dataset, tar=l_genes[which(l_names=="PLT1")], 
reg=l_genes[which(l_names=="ARF8")], times=times, time_step=1, thr_cor=0.7, 
tol=0.15, delaymax=3, delayspan=12, reg.name="ARF8",tar.name="PLT1")


}
\keyword{Side functions}
