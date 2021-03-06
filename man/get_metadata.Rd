% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/antigen.garnish_assemble.R
\name{get_metadata}
\alias{get_metadata}
\title{Internal function to add metadata by \code{ensembl_transcript_id}}
\usage{
get_metadata(dt, humandb = "GRCh38", mousedb = "GRCm38")
}
\arguments{
\item{dt}{Data table with \code{INFO} column.}

\item{humandb}{Character vector. One of \code{GRCh37} or \code{GRCh38}.}

\item{mousedb}{Character vector. One of \code{GRCm37} or \code{GRCm38}.}
}
\description{
Internal function to add metadata by \code{ensembl_transcript_id}
}
