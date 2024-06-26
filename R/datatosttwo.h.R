
# This file is automatically generated, you probably don't want to edit this

dataTOSTtwoOptions <- if (requireNamespace("jmvcore", quietly=TRUE)) R6::R6Class(
    "dataTOSTtwoOptions",
    inherit = jmvcore::Options,
    public = list(
        initialize = function(
            deps = NULL,
            group = NULL,
            var_equal = FALSE,
            hypothesis = "EQU",
            low_eqbound = -0.5,
            high_eqbound = 0.5,
            eqbound_type = "raw",
            alpha = 0.05,
            desc = FALSE,
            plots = FALSE,
            descplots = FALSE,
            low_eqbound_d = -999999999,
            high_eqbound_d = -999999999,
            smd_type = "g", ...) {

            super$initialize(
                package="TOSTER",
                name="dataTOSTtwo",
                requiresData=TRUE,
                ...)

            private$..deps <- jmvcore::OptionVariable$new(
                "deps",
                deps,
                permitted=list(
                    "numeric"),
                suggested=list(
                    "continuous"))
            private$..group <- jmvcore::OptionVariable$new(
                "group",
                group,
                suggested=list(
                    "nominal",
                    "ordinal"))
            private$..var_equal <- jmvcore::OptionBool$new(
                "var_equal",
                var_equal,
                default=FALSE)
            private$..hypothesis <- jmvcore::OptionList$new(
                "hypothesis",
                hypothesis,
                options=list(
                    "EQU",
                    "MET"),
                default="EQU")
            private$..low_eqbound <- jmvcore::OptionNumber$new(
                "low_eqbound",
                low_eqbound,
                default=-0.5)
            private$..high_eqbound <- jmvcore::OptionNumber$new(
                "high_eqbound",
                high_eqbound,
                default=0.5)
            private$..eqbound_type <- jmvcore::OptionList$new(
                "eqbound_type",
                eqbound_type,
                options=list(
                    "SMD",
                    "raw"),
                default="raw")
            private$..alpha <- jmvcore::OptionNumber$new(
                "alpha",
                alpha,
                default=0.05)
            private$..desc <- jmvcore::OptionBool$new(
                "desc",
                desc,
                default=FALSE)
            private$..plots <- jmvcore::OptionBool$new(
                "plots",
                plots,
                default=FALSE)
            private$..descplots <- jmvcore::OptionBool$new(
                "descplots",
                descplots,
                default=FALSE)
            private$..low_eqbound_d <- jmvcore::OptionNumber$new(
                "low_eqbound_d",
                low_eqbound_d,
                default=-999999999,
                hidden=TRUE)
            private$..high_eqbound_d <- jmvcore::OptionNumber$new(
                "high_eqbound_d",
                high_eqbound_d,
                default=-999999999,
                hidden=TRUE)
            private$..smd_type <- jmvcore::OptionList$new(
                "smd_type",
                smd_type,
                options=list(
                    "d",
                    "g"),
                default="g")

            self$.addOption(private$..deps)
            self$.addOption(private$..group)
            self$.addOption(private$..var_equal)
            self$.addOption(private$..hypothesis)
            self$.addOption(private$..low_eqbound)
            self$.addOption(private$..high_eqbound)
            self$.addOption(private$..eqbound_type)
            self$.addOption(private$..alpha)
            self$.addOption(private$..desc)
            self$.addOption(private$..plots)
            self$.addOption(private$..descplots)
            self$.addOption(private$..low_eqbound_d)
            self$.addOption(private$..high_eqbound_d)
            self$.addOption(private$..smd_type)
        }),
    active = list(
        deps = function() private$..deps$value,
        group = function() private$..group$value,
        var_equal = function() private$..var_equal$value,
        hypothesis = function() private$..hypothesis$value,
        low_eqbound = function() private$..low_eqbound$value,
        high_eqbound = function() private$..high_eqbound$value,
        eqbound_type = function() private$..eqbound_type$value,
        alpha = function() private$..alpha$value,
        desc = function() private$..desc$value,
        plots = function() private$..plots$value,
        descplots = function() private$..descplots$value,
        low_eqbound_d = function() private$..low_eqbound_d$value,
        high_eqbound_d = function() private$..high_eqbound_d$value,
        smd_type = function() private$..smd_type$value),
    private = list(
        ..deps = NA,
        ..group = NA,
        ..var_equal = NA,
        ..hypothesis = NA,
        ..low_eqbound = NA,
        ..high_eqbound = NA,
        ..eqbound_type = NA,
        ..alpha = NA,
        ..desc = NA,
        ..plots = NA,
        ..descplots = NA,
        ..low_eqbound_d = NA,
        ..high_eqbound_d = NA,
        ..smd_type = NA)
)

dataTOSTtwoResults <- if (requireNamespace("jmvcore", quietly=TRUE)) R6::R6Class(
    "dataTOSTtwoResults",
    inherit = jmvcore::Group,
    active = list(
        text = function() private$.items[["text"]],
        tost = function() private$.items[["tost"]],
        eqb = function() private$.items[["eqb"]],
        effsize = function() private$.items[["effsize"]],
        desc = function() private$.items[["desc"]],
        plots = function() private$.items[["plots"]],
        descplots = function() private$.items[["descplots"]]),
    private = list(),
    public=list(
        initialize=function(options) {
            super$initialize(
                options=options,
                name="",
                title="TOST Independent Samples T-Test")
            self$add(jmvcore::Html$new(
                options=options,
                name="text",
                refs=list(
                    "TOSTER")))
            self$add(jmvcore::Table$new(
                options=options,
                name="tost",
                title="TOST Results",
                rows="(deps)",
                clearWith=list(
                    "group",
                    "alpha",
                    "hypothesis",
                    "low_eqbound",
                    "high_eqbound",
                    "eqbound_type",
                    "var_equal"),
                columns=list(
                    list(
                        `name`="var", 
                        `title`="", 
                        `type`="text", 
                        `content`="($key)"),
                    list(
                        `name`="b[0]", 
                        `title`="", 
                        `type`="text", 
                        `content`="t-test"),
                    list(
                        `name`="t[0]", 
                        `title`="t", 
                        `type`="number"),
                    list(
                        `name`="df[0]", 
                        `title`="df", 
                        `type`="number"),
                    list(
                        `name`="p[0]", 
                        `title`="p", 
                        `type`="number", 
                        `format`="zto,pvalue"),
                    list(
                        `name`="b[1]", 
                        `title`="", 
                        `type`="text", 
                        `content`="TOST Upper"),
                    list(
                        `name`="t[1]", 
                        `title`="t", 
                        `type`="number"),
                    list(
                        `name`="df[1]", 
                        `title`="df", 
                        `type`="number"),
                    list(
                        `name`="p[1]", 
                        `title`="p", 
                        `type`="number", 
                        `format`="zto,pvalue"),
                    list(
                        `name`="b[2]", 
                        `title`="", 
                        `type`="text", 
                        `content`="TOST Lower"),
                    list(
                        `name`="t[2]", 
                        `title`="t", 
                        `type`="number"),
                    list(
                        `name`="df[2]", 
                        `title`="df", 
                        `type`="number"),
                    list(
                        `name`="p[2]", 
                        `title`="p", 
                        `type`="number", 
                        `format`="zto,pvalue"))))
            self$add(jmvcore::Table$new(
                options=options,
                name="eqb",
                title="Equivalence Bounds",
                rows="(deps)",
                clearWith=list(
                    "group",
                    "alpha",
                    "low_eqbound",
                    "high_eqbound",
                    "eqbound_type",
                    "var_equal"),
                columns=list(
                    list(
                        `name`="var", 
                        `title`="", 
                        `type`="text", 
                        `content`="($key)"),
                    list(
                        `name`="stat[cohen]", 
                        `title`="", 
                        `type`="text"),
                    list(
                        `name`="low[cohen]", 
                        `title`="Low", 
                        `type`="number"),
                    list(
                        `name`="high[cohen]", 
                        `title`="High", 
                        `type`="number"),
                    list(
                        `name`="stat[raw]", 
                        `title`="", 
                        `type`="text"),
                    list(
                        `name`="low[raw]", 
                        `title`="Low", 
                        `type`="number"),
                    list(
                        `name`="high[raw]", 
                        `title`="High", 
                        `type`="number"))))
            self$add(jmvcore::Table$new(
                options=options,
                name="effsize",
                title="Effect Sizes",
                rows="(deps)",
                clearWith=list(
                    "group",
                    "alpha",
                    "low_eqbound",
                    "high_eqbound",
                    "eqbound_type",
                    "var_equal"),
                columns=list(
                    list(
                        `name`="var", 
                        `title`="", 
                        `type`="text", 
                        `content`="($key)"),
                    list(
                        `name`="stat[cohen]", 
                        `title`="", 
                        `type`="text"),
                    list(
                        `name`="est[cohen]", 
                        `title`="Estimate", 
                        `type`="number"),
                    list(
                        `name`="cil[cohen]", 
                        `title`="Lower", 
                        `superTitle`="Confidence Interval"),
                    list(
                        `name`="ciu[cohen]", 
                        `title`="Upper", 
                        `superTitle`="Confidence Interval"),
                    list(
                        `name`="stat[raw]", 
                        `title`="", 
                        `type`="text", 
                        `content`="Raw"),
                    list(
                        `name`="est[raw]", 
                        `title`="Estimate", 
                        `type`="number"),
                    list(
                        `name`="cil[raw]", 
                        `title`="Lower", 
                        `superTitle`="Confidence Interval"),
                    list(
                        `name`="ciu[raw]", 
                        `title`="Upper", 
                        `superTitle`="Confidence Interval"))))
            self$add(jmvcore::Table$new(
                options=options,
                name="desc",
                title="Descriptives",
                visible="(desc)",
                rows="(deps)",
                clearWith=list(
                    "group"),
                columns=list(
                    list(
                        `name`="name[1]", 
                        `title`="", 
                        `type`="text"),
                    list(
                        `name`="n[1]", 
                        `title`="N", 
                        `type`="integer"),
                    list(
                        `name`="m[1]", 
                        `title`="Mean", 
                        `type`="number"),
                    list(
                        `name`="med[1]", 
                        `title`="Median", 
                        `type`="number"),
                    list(
                        `name`="sd[1]", 
                        `title`="SD", 
                        `type`="number"),
                    list(
                        `name`="se[1]", 
                        `title`="SE", 
                        `type`="number"),
                    list(
                        `name`="name[2]", 
                        `title`="", 
                        `type`="text"),
                    list(
                        `name`="n[2]", 
                        `title`="N", 
                        `type`="integer"),
                    list(
                        `name`="m[2]", 
                        `title`="Mean", 
                        `type`="number"),
                    list(
                        `name`="med[2]", 
                        `title`="Median", 
                        `type`="number"),
                    list(
                        `name`="sd[2]", 
                        `title`="SD", 
                        `type`="number"),
                    list(
                        `name`="se[2]", 
                        `title`="SE", 
                        `type`="number"))))
            self$add(jmvcore::Array$new(
                options=options,
                name="plots",
                title="Effect Size Plot",
                items="(deps)",
                visible="(plots)",
                template=jmvcore::Image$new(
                    options=options,
                    title="$key",
                    renderFun=".plot",
                    width=500,
                    height=500,
                    clearWith=list(
                        "group",
                        "alpha",
                        "hypothesis",
                        "smd_type",
                        "low_eqbound",
                        "high_eqbound",
                        "eqbound_type",
                        "var_equal"))))
            self$add(jmvcore::Array$new(
                options=options,
                name="descplots",
                title="Data Plot",
                items="(deps)",
                visible="(descplots)",
                template=jmvcore::Image$new(
                    options=options,
                    title="$key",
                    renderFun=".descplot",
                    width=400,
                    height=375,
                    clearWith=list(
                        "group",
                        "alpha",
                        "hypothesis",
                        "smd_type",
                        "low_eqbound",
                        "high_eqbound",
                        "eqbound_type",
                        "var_equal"))))}))

dataTOSTtwoBase <- if (requireNamespace("jmvcore", quietly=TRUE)) R6::R6Class(
    "dataTOSTtwoBase",
    inherit = jmvcore::Analysis,
    public = list(
        initialize = function(options, data=NULL, datasetId="", analysisId="", revision=0) {
            super$initialize(
                package = "TOSTER",
                name = "dataTOSTtwo",
                version = c(1,0,0),
                options = options,
                results = dataTOSTtwoResults$new(options=options),
                data = data,
                datasetId = datasetId,
                analysisId = analysisId,
                revision = revision,
                pause = NULL,
                completeWhenFilled = FALSE,
                requiresMissings = FALSE)
        }))

#' TOST Independent Samples T-Test
#'
#' TOST Independent Samples T-Test for jamovi. This function is not meant to 
#' be utilized in R. See t_TOST function.
#'
#' @examples
#' library(TOSTER)
#'
#' ## Load iris dataset, remove one of the three groups so two are left
#'
#' data<-iris[which(iris$Species!="versicolor"),]
#'
#' ## TOST procedure on the raw data
#'
#' dataTOSTtwo(data, deps="Sepal.Width", group="Species", var_equal = TRUE, low_eqbound = -0.5,
#'             high_eqbound = 0.5, alpha = 0.05, desc = TRUE, plots = TRUE)
#'
#' @section References:
#' Berger, R. L., & Hsu, J. C. (1996). Bioequivalence Trials, Intersection-Union Tests and Equivalence Confidence Sets. Statistical Science, 11(4), 283-302.
#'
#' Gruman, J. A., Cribbie, R. A., & Arpin-Cribbie, C. A. (2007). The effects of heteroscedasticity on tests of equivalence. Journal of Modern Applied Statistical Methods, 6(1), 133-140, formula for Welch's t-test on page 135
#'
#' @param data the data as a data frame
#' @param deps a vector of strings naming dependent variables in \code{data}
#' @param group a string naming the grouping variable in \code{data}; must
#'   have two levels
#' @param var_equal \code{TRUE} or \code{FALSE} (default), assume equal
#'   variances
#' @param hypothesis \code{'EQU'} for equivalence (default), or \code{'MET'}
#'   for minimal effects test, the alternative hypothesis.
#' @param low_eqbound a number (default: -0.5) the lower equivalence/MET
#'   bounds
#' @param high_eqbound a number (default: 0.5) the upper equivalence/MET
#'   bounds
#' @param eqbound_type \code{'SMD'} (default) or \code{'raw'}; whether the
#'   bounds are specified in Cohen's d or raw units respectively
#' @param alpha alpha level (default = 0.05)
#' @param desc \code{TRUE} or \code{FALSE} (default), provide descriptive
#'   statistics
#' @param plots \code{TRUE} or \code{FALSE} (default), provide effect size
#'   plots
#' @param descplots \code{TRUE} or \code{FALSE} (default), provide plots
#' @param low_eqbound_d deprecated
#' @param high_eqbound_d deprecated
#' @param smd_type \code{'d'} (default) or \code{'g'}; whether the calculated
#'   effect size is biased (d) or bias-corrected (g).
#' @return A results object containing:
#' \tabular{llllll}{
#'   \code{results$text} \tab \tab \tab \tab \tab a html \cr
#'   \code{results$tost} \tab \tab \tab \tab \tab a table \cr
#'   \code{results$eqb} \tab \tab \tab \tab \tab a table \cr
#'   \code{results$effsize} \tab \tab \tab \tab \tab a table \cr
#'   \code{results$desc} \tab \tab \tab \tab \tab a table \cr
#'   \code{results$plots} \tab \tab \tab \tab \tab an array of images \cr
#'   \code{results$descplots} \tab \tab \tab \tab \tab an array of images \cr
#' }
#'
#' Tables can be converted to data frames with \code{asDF} or \code{\link{as.data.frame}}. For example:
#'
#' \code{results$tost$asDF}
#'
#' \code{as.data.frame(results$tost)}
#'
#' @export
dataTOSTtwo <- function(
    data,
    deps,
    group,
    var_equal = FALSE,
    hypothesis = "EQU",
    low_eqbound = -0.5,
    high_eqbound = 0.5,
    eqbound_type = "raw",
    alpha = 0.05,
    desc = FALSE,
    plots = FALSE,
    descplots = FALSE,
    low_eqbound_d = -999999999,
    high_eqbound_d = -999999999,
    smd_type = "g") {

    if ( ! requireNamespace("jmvcore", quietly=TRUE))
        stop("dataTOSTtwo requires jmvcore to be installed (restart may be required)")

    if ( ! missing(deps)) deps <- jmvcore::resolveQuo(jmvcore::enquo(deps))
    if ( ! missing(group)) group <- jmvcore::resolveQuo(jmvcore::enquo(group))
    if (missing(data))
        data <- jmvcore::marshalData(
            parent.frame(),
            `if`( ! missing(deps), deps, NULL),
            `if`( ! missing(group), group, NULL))


    options <- dataTOSTtwoOptions$new(
        deps = deps,
        group = group,
        var_equal = var_equal,
        hypothesis = hypothesis,
        low_eqbound = low_eqbound,
        high_eqbound = high_eqbound,
        eqbound_type = eqbound_type,
        alpha = alpha,
        desc = desc,
        plots = plots,
        descplots = descplots,
        low_eqbound_d = low_eqbound_d,
        high_eqbound_d = high_eqbound_d,
        smd_type = smd_type)

    analysis <- dataTOSTtwoClass$new(
        options = options,
        data = data)

    analysis$run()

    analysis$results
}

