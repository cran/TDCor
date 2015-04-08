\name{TF}
\alias{TF}
\title{
Table of 1834 Arabidopsis Transcription factors
}
\description{
\code{TF} is a dataframe with two columns. The first column contains the AGI gene code of 1834 genes encoding Arabidopsis transcription factors. The second column contains the associated gene names.
}
\usage{data("TF")}
\source{
Data published on the Agris database website (\url{http://arabidopsis.med.ohio-state.edu/AtTFDB/}).
}
\references{
Davuluri \emph{et al.} (2003), \bold{AGRIS: Arabidopsis Gene Regulatory Information Server, an information resource of Arabidopsis cis-regulatory elements and transcription factors}, BMC Bioinformatics, \bold{4}:25
}
\examples{
# Load the database
data(TF)

# Obtain the transcription factors for which data is available in the LR dataset
# i.e. present on ATH1 chip and differentially expressed.
data(LR_dataset)
clean.at(LR_dataset,TF[,1])
}
\keyword{datasets}
