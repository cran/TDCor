\name{LR_dataset}
\alias{LR_dataset}
\docType{data}
\title{
Lateral root transcriptomic dataset
}
\description{
LR_dataset is a matrix of dimension 15240 lines x 18 columns. It stores a time-series transcriptomic dataset following the changes occuring in a young Arabidopsis root during the formation of a lateral root. To generate this dataset, lateral root formation was locally induced by a gravistimulus at t=0 and the stimulated part of the roots was collected 
every 3 hours from 6 hours to 54 hours. The transcriptomes were analyzed using the ATH1 affymetrix chip.  
For time point 0, unstimulated young primary root was taken as a control. Importantly, the transcript accumulation levels stored in this dataset are non-log2 values.
}
\usage{data("LR_dataset")}
\details{
The experiment spanned 54 hours in order to cover all aspects of lateral root development. Using this method, 
lateral root initiation (the first pericycle divisions) occurs synchroneously in all stimulated roots around 12 hours after stimulation 
and the fully formed lateral root emerges from the parental root around 45 hours. The dataset contains data for all significantly differentially 
expressed genes. \cr

Each column is the average of 4 independent replicates. The columns are organized in the following order: 0, 6, 9, 12, 15, 18, 21, 24, 27, 30, 33, 36, 39, 42, 45, 48, 51 and 54 hours. Each line of the matrix is labbelled with an AGI gene code (Arabidopsis Genome Initiative gene code).
}
\source{
Voss \emph{et al.}, Lateral root organ initiation re-phases the circadian clock in Arabidopsis thaliana. Nature communication, \emph{in revision}.
}
\examples{
# Load the dataset
data(LR_dataset)

# Have a look at the first rows
head(LR_dataset)
}
\keyword{datasets}
