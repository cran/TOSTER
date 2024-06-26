
#' @import ggplot2
dataTOSToneClass <- R6::R6Class(
  "dataTOSToneClass",
  inherit = dataTOSToneBase,
  private = list(
    .init = function() {

      ci <- 100 - as.integer(self$options$alpha * 200)

      tt <- self$results$tost
      eqb <- self$results$eqb
      effsize <- self$results$effsize

      effsize$getColumn('cil[cohen]')$setSuperTitle(jmvcore::format('{}% Confidence interval', ci))
      effsize$getColumn('ciu[cohen]')$setSuperTitle(jmvcore::format('{}% Confidence interval', ci))
      effsize$getColumn('cil[raw]')$setSuperTitle(jmvcore::format('{}% Confidence interval', ci))
      effsize$getColumn('ciu[raw]')$setSuperTitle(jmvcore::format('{}% Confidence interval', ci))

      for (key in eqb$rowKeys)
        eqb$setRow(rowKey=key, values=list(`cil[cohen]`='', `ciu[cohen]`=''))
    },
    .run = function() {

      tt <- self$results$tost
      eqb <- self$results$eqb
      effsize <- self$results$effsize
      desc <- self$results$desc
      plots <- self$results$plots

      alpha <- self$options$alpha
      mu  <- self$options$mu

      for (name in self$options$vars) {
        var <- jmvcore::toNumeric(self$data[[name]])
        var <- na.omit(var)
        n   <- length(var)
        m   <- base::mean(var)
        med <- stats::median(var)
        sd  <- stats::sd(var)
        se  <- sd/sqrt(n)
        res <- t.test(var-mu)
        t   <- unname(res$statistic)
        pttest   <- unname(res$p.value)


        low_eqbound    <- self$options$low_eqbound
        high_eqbound   <- self$options$high_eqbound
        if (self$options$eqbound_type == 'SMD') {
          eqbound_type = "SMD"
          pr_l_eqb = low_eqbound * sd
          pr_h_eqb = high_eqbound * sd
        } else {
          eqbound_type = "raw"
          pr_l_eqb = low_eqbound
          pr_h_eqb = high_eqbound
        }

        if(self$options$hypothesis == "EQU"){
          alt_low = "greater"
          alt_high = "less"
          test_hypothesis = "Hypothesis Tested: Equivalence"
          null_hyp = paste0(round(pr_l_eqb,2),
                            " >= (Mean - mu) or (Mean - mu) >= ",
                            round(pr_h_eqb,2))
          alt_hyp = paste0(round(pr_l_eqb,2),
                           " < (Mean - mu) < ",
                           round(pr_h_eqb,2))
        } else if(self$options$hypothesis == "MET"){
          alt_low = "less"
          alt_high = "greater"
          test_hypothesis = "Hypothesis Tested: Minimal Effect"
          null_hyp = paste0(round(pr_l_eqb,2),
                            " <= (Mean - mu)  <= ",
                            round(pr_h_eqb,2))
          alt_hyp = paste0(round(pr_l_eqb,2),
                           " > (Mean - mu) or (Mean - mu)  > ",
                           round(pr_h_eqb,2))
        }

        if(self$options$smd_type == 'g'){
          bias_c = TRUE
        } else {
          bias_c = FALSE
        }
        TOSTres = t_TOST(x = var,
                         hypothesis = self$options$hypothesis,
                         low_eqbound = low_eqbound,
                         high_eqbound = high_eqbound,
                         eqbound_type = eqbound_type,
                         alpha = alpha,
                         bias_correction = bias_c,
                         smd_ci = "goulet")

        if(grepl(TOSTres$decision$ttest, pattern="non")){
          nhst_text = "&#10060 NHST: don't reject null significance hypothesis that the effect is equal to zero"
        } else{
          nhst_text = "&#9989 NHST: reject null significance hypothesis that the effect is equal to zero"

        }

        if(self$options$hypothesis == "EQU"){
          tost_hypt = "equivalence"
        } else{
          tost_hypt = "MET"
        }

        if(grepl(TOSTres$decision$TOST, pattern="non")){
          TOST_text = paste0("&#10060 TOST: don't reject null ", tost_hypt,"  hypothesis")
        } else{
          TOST_text = paste0("&#9989 TOST: reject null ", tost_hypt,"  hypothesis")

        }

        text_res = paste0(test_hypothesis,
                          "<br> <br>",
                          "Null Hypothesis: ", null_hyp,"<br>",
                          "Alternative: ", alt_hyp,"<br>",
                          nhst_text, "<br>",
                          TOST_text, "<br>",
                          "<br> Note: SMD confidence intervals are an approximation. See our <a href=\"https://aaroncaldwell.us/TOSTERpkg/articles/SMD_calcs.html\">documentation</a>. <br>",
                          ifelse(self$options$eqbound_type == 'SMD',
                                 "<br> &#x1f6a8; Warning: standardized bounds produce biased results. Consider setting bounds in raw units.", ""))


        tt$setRow(rowKey=name,
                  list(
                    `t[0]` = TOSTres$TOST$t[1],
                    `df[0]` = TOSTres$TOST$df[1],
                    `p[0]` = TOSTres$TOST$p.value[1],
                    `t[1]` = TOSTres$TOST$t[2],
                    `df[1]` = TOSTres$TOST$df[2],
                    `p[1]` = TOSTres$TOST$p.value[2],
                    `t[2]` = TOSTres$TOST$t[3],
                    `df[2]` = TOSTres$TOST$df[3],
                    `p[2]` = TOSTres$TOST$p.value[3]
                  ))

        eqb$setRow(rowKey=name, list(
          `low[raw]` = TOSTres$eqb$low_eq[1],
          `high[raw]` = TOSTres$eqb$high_eq[1],
          `low[cohen]` = TOSTres$eqb$low_eq[2],
          `high[cohen]` = TOSTres$eqb$high_eq[2]))

        effsize$setRow(
          rowKey = name,
          list(
            `stat[cohen]` = TOSTres$smd$smd_label,
            `est[cohen]` = TOSTres$smd$d,
            `cil[cohen]` = TOSTres$smd$dlow,
            `ciu[cohen]` = TOSTres$smd$dhigh,
            `est[raw]` = TOSTres$effsize$estimate[1],
            `cil[raw]` = TOSTres$effsize$lower.ci[1],
            `ciu[raw]` = TOSTres$effsize$upper.ci[1]
          )
        )




        self$results$text$setContent(text_res)

        desc$setRow(rowKey=name, list(n = n,
                                      m = m,
                                      med = med,
                                      sd = sd,
                                      se = se))

        plot <- plots$get(key=name)
        plot$setState(TOSTres)
      }

    },
    .plot=function(image, ggtheme, theme, ...) {

      if (is.null(image$state))
        return(FALSE)

      TOSTres <- image$state

      plotTOSTr = plot_tost_jam(TOSTres,
                                ggtheme = ggtheme)
      print(plotTOSTr)

      return(TRUE)
    })
)
