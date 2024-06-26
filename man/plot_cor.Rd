% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/plot_corr.R
\name{plot_cor}
\alias{plot_cor}
\title{Plot correlation coefficients}
\usage{
plot_cor(
  r,
  n,
  method = c("pearson", "spearman", "kendall"),
  type = c("c", "cd"),
  levels = c(0.68, 0.9, 0.95, 0.999)
)
}
\arguments{
\item{r}{The observed correlation coefficient.}

\item{n}{Total number of observations (sample size).}

\item{method}{The method by which the coefficient was calculated: pearson, spearman, or kendall (default is "pearson")}

\item{type}{Choose whether to plot a "consonance" function ("c"), consonance density ("cd"), or both (c("c","cd"); default option).}

\item{levels}{Numeric vector of confidence levels to display}
}
\value{
Returns plot of the distribution of the correlation coefficient.
}
\description{
\ifelse{html}{\href{https://lifecycle.r-lib.org/articles/stages.html#stable}{\figure{lifecycle-stable.svg}{options: alt='[Stable]'}}}{\strong{[Stable]}}

Function to produce plots of the distribution of standard correlation coefficients.
}
\details{
This function was created so that users could create consonance plots of Pearson's correlation coefficient.
These types of plots are discussed by Schweder T, Hjort NL. (2016, ISBN:9781316445051) and Rafi Z, Greenland S. (2020) \url{doi:10.1186/s12874-020-01105-9}.
}
\seealso{
Other Correlations: 
\code{\link{boot_cor_test}()},
\code{\link{corsum_test}()},
\code{\link{power_z_cor}()},
\code{\link{z_cor_test}()}

Other plotting functions: 
\code{\link{plot_pes}()},
\code{\link{plot_smd}()}
}
\concept{Correlations}
\concept{plotting functions}
