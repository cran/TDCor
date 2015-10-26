\name{TDCor-package}
\alias{TDCor-package}
\docType{package}
\title{
TDCor algorithm for gene regulatory network inference
}
\description{
TDCor (Time-Delay Correlation) is an algorithm designed to infer the topology of a gene regulatory network (GRN) from time-series transcriptomic data. The algorithm is described in details in Lavenus \emph{et al.}, Plant Cell, 2015. It was initially developped to infer the topology of the GRN controlling lateral root formation in \emph{Arabidopsis thaliana}. The time-series transcriptomic dataset analysed in this study is included in the package.
}
\details{
\tabular{ll}{
Package: \tab TDCor\cr
Type: \tab Package\cr
Version: \tab 1.2\cr
Date: \tab 2015-10-05\cr
License: GNU General Public License Version 2
}
The reconstruction of a gene network using the TDCor package involves six steps.\cr
\enumerate{
\item{
Load the averaged non-log2 time series transcriptomic data into the R workspace.
}
\item{
Define the vector \code{\link{times}} containing the times (in hours) at which the samples were collected.
}
\item{
Define the vector containing the gene codes of the genes you want to reconstruct the network with (e.g. see \code{\link{l_genes}}), as well as the associated gene names (e.g. see \code{\link{l_names}}) and the associated prior (e.g. see \code{\link{l_prior}}).
}
\item{
Build or update the TPI database using the \code{\link{CalculateTPI}} or \code{\link{UpdateTPI}} functions.
}
\item{
Build or update the DPI database using the \code{\link{CalculateDPI}} or \code{\link{UpdateDPI}} functions.
}
\item{
Reconstruct the network using the \code{\link{TDCOR}} main function.
}
}
See examples below.\cr

Besides the functions of the TDCor algorithm, the package also contains the lateral root transcriptomic dataset (\code{\link{LR_dataset}}), the \code{times} vector to use with this dataset (\code{\link{times}}), the vector of AGI gene codes used to reconstruct the network shown in the original paper (\code{\link{l_genes}}), the vector of the gene names (\code{\link{l_names}}) and the prior (\code{\link{l_prior}}). The associated TPI and DPI databases (\code{TPI10} and \code{DPI15}) which were used to build the network shown in the original paper are not included. Hence to reconstruct the lateral root network, these first need to be generated. A database of about 1800 \emph{Arabidopsis} transcription factors is also included (\code{\link{TF}}).

Three side functions, \code{\link{estimate.delay}}, \code{\link{shortest.path}} and \code{\link{draw.profile}} are also available to the user. These can be used to visualize the transcriptomic data, optimize some of the TDCOR parameters, and analyze the networks.
}
\author{
Author: Julien Lavenus  \email{jl.tdcor@gmail.com}\cr
Maintainer: Mikael Lucas \email{mikael.lucas@ird.fr}
}
\references{
Lavenus \emph{et al.} (2015), \bold{Inference of the Arabidopsis lateral root gene regulatory network suggests a bifurcation mechanism that defines primordia flanking and central zones.} The Plant Cell, \emph{in press}.
}

\seealso{
See also \code{\link{CalculateDPI}},  \code{\link{CalculateTPI}}, \code{\link{UpdateDPI}},  \code{\link{UpdateTPI}}, \code{\link{TDCOR}}, \code{\link{estimate.delay}}.
}

\examples{
\dontrun{
# Load the LR transcriptomic dataset
data(LR_dataset)

# Load the vectors of genes codes, gene names and prior
data(l_genes)
data(l_names)
data(l_prior)

# Load the vector of time points for the LR_dataset
data(times)

# Generate the TPI database (this may take several hours) 

TPI10=CalculateTPI(dataset=LR_dataset,l_genes=l_genes,l_prior=l_prior, 
times=times,time_step=1,N=10000,ks_int=c(0.5,3),kd_int=c(0.5,3), 
delta_int=c(0.5,3),noise=0.1,delay=3)

# Generate the DPI database (this may take several hours) 

DPI15=CalculateDPI(dataset=LR_dataset,l_genes=l_genes,l_prior=l_prior, 
times=times,time_step=1,N=10000,ks_int=c(0.5,3),kd_int=c(0.5,3), 
delta_int=c(0.5,3), noise=0.15, delay=3)

# Check/update if necessary the databases

TPI10=UpdateTPI(TPI10,LR_dataset,l_genes,l_prior)
DPI15=UpdateDPI(DPI15,LR_dataset,l_genes,l_prior)

# Choose your parameters 

ptime_step=1			
ptol=0.13			
pdelayspan=12			
pthr_cor=c(0.65,0.8)	
pdelaymax=c(2.5,3.5)		
pdelaymin=0			
pdelay=3			
pthrpTPI=c(0.55,0.8)		
pthrpDPI=c(0.65,0.8)		
pthr_overlap=c(0.4,0.6)		
pthr_ind1=0.65			
pthr_ind2=3.5			
pn0=1000			
pn1=10				
pregmax=5					
pthr_isr=c(4,6)			
pTPI=TPI10			
pDPI=DPI15			
pMinTarNumber=5			
pMinProp=0.6			
poutfile_name="TDCor_output.txt"	


# Reconstruct the network

tdcor_out= TDCOR(dataset=LR_dataset, l_genes=l_genes,l_names=l_names,n0=pn0,n1=pn1,
l_prior=l_prior, thr_ind1=pthr_ind1,thr_ind2=pthr_ind2,regmax=pregmax,thr_cor=pthr_cor,
delayspan=pdelayspan,delaymax=pdelaymax,delaymin=pdelaymin,delay=pdelay,thrpTPI=pthrpTPI,
thrpDPI=pthrpDPI,TPI=pTPI,DPI=pDPI,thr_isr=pthr_isr,time_step=ptime_step,thr_overlap=pthr_overlap,
tol=ptol,MinProp=pMinProp,MinTarNumber=pMinTarNumber,outfile_name=poutfile_name)

}
}
