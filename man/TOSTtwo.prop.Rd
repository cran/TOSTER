% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/TOSTtwo.prop.R
\name{TOSTtwo.prop}
\alias{TOSTtwo.prop}
\title{TOST function for two proportions (raw scores)}
\usage{
TOSTtwo.prop(
  prop1,
  prop2,
  n1,
  n2,
  low_eqbound,
  high_eqbound,
  alpha,
  ci_type = "normal",
  plot = TRUE,
  verbose = TRUE
)
}
\arguments{
\item{prop1}{proportion of group 1}

\item{prop2}{proportion of group 2}

\item{n1}{sample size in group 1}

\item{n2}{sample size in group 2}

\item{low_eqbound}{lower equivalence bounds (e.g., -0.1) expressed in proportions}

\item{high_eqbound}{upper equivalence bounds (e.g., 0.1) expressed in proportions}

\item{alpha}{alpha level (default = 0.05)}

\item{ci_type}{confidence interval type (default = "normal"). "wilson" produces Wilson score intervals with a Yates continuity correction while "normal" calculates the simple asymptotic method with no continuity correction.}

\item{plot}{set whether results should be plotted (plot = TRUE) or not (plot = FALSE) - defaults to TRUE}

\item{verbose}{logical variable indicating whether text output should be generated (verbose = TRUE) or not (verbose = FALSE) - default to TRUE}
}
\value{
Returns TOST z-value 1, TOST p-value 1, TOST z-value 2, TOST p-value 2, low equivalence bound, high equivalence bound, Lower limit confidence interval TOST, Upper limit confidence interval TOST
}
\description{
\ifelse{html}{\href{https://lifecycle.r-lib.org/articles/stages.html#superseded}{\figure{lifecycle-superseded.svg}{options: alt='[Superseded]'}}}{\strong{[Superseded]}}

Development on \code{TOSTtwo.prop} is complete, and for new code we recommend
switching to \link{twoprop_test}, which is easier to use, more featureful,
and still under active development.
}
\examples{
## Equivalence test for two independent proportions equal to .65 and .70, with 100 samples
## per group, lower equivalence bound of -0.1, higher equivalence bound of 0.1, and alpha of 0.05.

TOSTtwo.prop(prop1 = .65, prop2 = .70, n1 = 100, n2 = 100,
   low_eqbound = -0.1, high_eqbound = 0.1, alpha = .05)

}
\references{
Tunes da Silva, G., Logan, B. R., & Klein, J. P. (2008). Methods for Equivalence and Noninferiority Testing. Biology of Blood Marrow Transplant, 15(1 Suppl), 120-127.

Yin, G. (2012). Clinical Trial Design: Bayesian and Frequentist Adaptive Methods. Hoboken, New Jersey: John Wiley & Sons, Inc.
}
