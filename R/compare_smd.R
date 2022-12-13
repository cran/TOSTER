#' @title Comparing SMDs between independent studies
#' @description A function to compare standardized mean differences (SMDs) between studies. This function is intended to be used to compare the compatibility of original studies with replication studies (lower p-values indicating lower compatibility)
#' @param smd1,smd2 SMDs from study 1 & 2, respectively.
#' @param n1,n2 sample size(s) from study 1 & 2, respectively (can be 1 number or vector of 2 numbers).
#' @param se1,se2 User supplied standard errors (SEs). This will override the internal calculations.
#' @param paired a logical indicating whether the SMD is from a paired or independent samples design. If a one-sample design, then paired must be set to TRUE.
#' @param null a number indicating the null hypothesis. For TOST, this would be equivalence bound.
#' @param alternative a character string specifying the alternative hypothesis, must be one of "two.sided" (default), "greater" or "less". You can specify just the initial letter.
#' @param TOST logical indicator (default = FALSE) to perform two one-sided tests of equivalence (TOST). Minimal effects testing not currently available. If specified, alternative is ignored.
#' @return A list with class "htest" containing the following components:
#' \describe{
#'   \item{\code{"statistic"}}{z-score}
#'   \item{\code{"p.value"}}{numeric scalar containing the p-value for the test under the null hypothesis.}
#'   \item{\code{"estimate"}}{difference in SMD between studies}
#'   \item{\code{"null.value"}}{the specified hypothesized value for the null hypothesis.}
#'   \item{\code{"alternative"}}{character string indicating the alternative hypothesis (the value of the input argument alternative). Possible values are "greater", "less", or "two-sided".}
#'   \item{\code{"method"}}{Type of SMD}
#'   \item{\code{"data.name"}}{"Summary Statistics" to denote summary statistics were utilized to obtain results.}
#'   \item{\code{"smd"}}{SMDs input for the function.}
#'   \item{\code{"sample_sizes"}}{Sample sizes input for the function.}
#'   \item{\code{"call"}}{the matched call.}
#' }
#' @name compare_smd
#' @family compare studies
#' @export compare_smd
#'

compare_smd = function(smd1,
                       n1,
                       se1 = NULL,
                       smd2,
                       n2,
                       se2 = NULL,
                       paired = FALSE,
                       alternative = c("two.sided", "less", "greater"),
                       null = 0,
                       TOST = FALSE){
  alternative <- match.arg(alternative)
  if(length(n1) > 2 || length(n2) > 2 || !is.numeric(n1) || !is.numeric(n1)){
    stop("n1 and n2 must be a numeric vector of a length of 1 or 2.")
  }
  if(paired && (length(n1) > 1 || length(n2) > 1)){
    stop("n1 and n2 must be a length of 1 if paired is TRUE.")
  }

  # difference in SMD minus null hypothesis
  d_diff = smd1 - smd2 - null

  if(!is.null(se1) || !is.null(se2)){
    message("User supplied standard errors. Proceed with caution.")
  }

  # calculate standard errors
  if(paired){
    if(!is.null(se1) || !is.null(se2)){
      meth = "Difference in SMDs (user-supplied SE)"
    } else{
      meth = "Difference in Cohen's dz (paired)"
    }
    if(is.null(se1)){
      se1 = se_dz(smd1, n1)
    } else{
      se1 = se1
    }
    if(is.null(se2)){
      se2 = se_dz(smd2, n2)
    } else{
      se2 = se2
    }

  } else{
    if(!is.null(se1) || !is.null(se2)){
      meth = "Difference in SMDs (user-supplied SE)"
    } else{
      meth = "Difference in Cohen's ds (two-sample)"
    }
    if(is.null(se1)){
      se1 = se_ds(smd1, n1)
    } else{
      se1 = se1
    }
    if(is.null(se2)){
      se2 = se_ds(smd2, n2)
    } else{
      se2 = se2
    }

  }

  # z-score and p-value
  se_diff = sqrt(se1^2 + se2^2)
  z = d_diff/se_diff
  names(z) = "z"
  pval = p_from_z(z, alternative = alternative)

  # Equivalence Testing
  if(TOST){
    d_diff2 = abs(smd1 - smd2) - null
    z2 = d_diff2/se_diff
    if(abs(z2) > abs(z)){
      z = z2
      names(z) = "z"
    }
    pval = p_from_z(z2, alternative = "less")
    alternative = "less"
  }

  est2 = smd1 - smd2
  names(est2) = "difference in SMDs"
  null2 = null
  names(null2) = "difference in SMDs"
  # Store as htest
  rval <- list(statistic = z, p.value = pval,
               #conf.int = cint,
               estimate = est2,
               null.value = null2,
               alternative = alternative,
               method = meth,
               smd = list(smd1 = smd1,
                          smd2 = smd2),
               sample_sizes = list(n1 = n1,
                                   n2 = n2),
               data.name = "Summary Statistics",
               call = match.call())
  class(rval) <- "htest"
  return(rval)
}