#' Power analysis for TOST for one-sample t-test (Cohen's d).
#' @param alpha alpha used for the test (e.g., 0.05)
#' @param statistical_power desired power (e.g., 0.8)
#' @param N sample size (e.g., 108)
#' @param low_eqbound_d lower equivalence bounds (e.g., -0.5) expressed in standardized mean difference (Cohen's d)
#' @param high_eqbound_d upper equivalence bounds (e.g., 0.5) expressed in standardized mean difference (Cohen's d)
#' @return Calculate either achieved power, equivalence bounds, or required N, assuming a true effect size of 0.
#' Returns a string summarizing the power analysis, and a numeric variable for number of observations, equivalence bounds, or power.
#' @examples
#' ## Sample size for alpha = 0.05, 90% power, equivalence bounds of
#' ## Cohen's d = -0.3 and Cohen's d = 0.3, and assuming true effect = 0
#' powerTOSTone(alpha=0.05, statistical_power=0.9, low_eqbound_d=-0.3, high_eqbound_d=0.3)
#'
#' ## Power for sample size of 121, alpha = 0.05, equivalence bounds of
#' ## Cohen's d = -0.3 and Cohen's d = 0.3, and assuming true effect = 0
#'
#' powerTOSTone(alpha=0.05, N=121, low_eqbound_d=-0.3, high_eqbound_d=0.3)
#'
#' ## Equivalence bounds for sample size of 121, alpha = 0.05, statistical power of
#' ## 0.9, and assuming true effect = 0
#'
#' powerTOSTone(alpha=0.05, N=121, statistical_power=.9)
#' @section References:
#' Chow, S.-C., Wang, H., & Shao, J. (2007). Sample Size Calculations in Clinical Research, Second Edition - CRC Press Book. Formula 3.1.9
#' @importFrom stats pnorm pt qnorm qt
#' @importFrom graphics abline plot points segments title
#' @export

powerTOSTone<-function(alpha, statistical_power, N, low_eqbound_d, high_eqbound_d){
  if(missing(N)) {
    NT1<-(qnorm(1-alpha)+qnorm(1-((1-statistical_power)/2)))^2/(low_eqbound_d)^2
    NT2<-(qnorm(1-alpha)+qnorm(1-((1-statistical_power)/2)))^2/(high_eqbound_d)^2
    N<-max(NT1,NT2)
    message(cat("The required sample size to achieve",100*statistical_power,"% power with equivalence bounds of",low_eqbound_d,"and",high_eqbound_d,"is",ceiling(N)))
    return(N)
  }
  if(missing(statistical_power)) {
    statistical_power1<-2*(pnorm((abs(low_eqbound_d)*sqrt(N))-qnorm(1-alpha))+pnorm(-(abs(low_eqbound_d)*sqrt(N))-qnorm(1-alpha)))-1
    statistical_power2<-2*(pnorm((abs(high_eqbound_d)*sqrt(N))-qnorm(1-alpha))+pnorm(-(abs(high_eqbound_d)*sqrt(N))-qnorm(1-alpha)))-1
    statistical_power<-min(statistical_power1,statistical_power2)
    if(statistical_power<0) {statistical_power<-0}
    message(cat("The statistical power is",round(100*statistical_power,2),"% for equivalence bounds of",low_eqbound_d,"and",high_eqbound_d,"."))
    return(statistical_power)
  }
  if(missing(low_eqbound_d) && missing(high_eqbound_d)) {
    low_eqbound_d<--sqrt((qnorm(1-alpha)+qnorm(1-((1-statistical_power)/2)))^2/N)
    high_eqbound_d<-sqrt((qnorm(1-alpha)+qnorm(1-((1-statistical_power)/2)))^2/N)
    message(cat("The equivalence bounds to achieve",100*statistical_power,"% power with N =",N,"are",round(low_eqbound_d,2),"and",round(high_eqbound_d,2),"."))
    bounds<-c(low_eqbound_d,high_eqbound_d)
    return(bounds)
  }
}
