# context("Test if values in examples in functions stay the same")
# library("TOSTER")

test_that("Test that one-sample t-test output is same as previous version", {
  hush = function(code) {
    sink("NUL") # use /dev/null in UNIX
    tmp = code
    sink()
    return(tmp)
  }
  hush(suppressMessages(TOSTone(m=0.54,mu=0.5,sd=1.2,n=100,low_eqbound_d=-0.3, high_eqbound_d=0.3, alpha=0.05,
                                plot = TRUE,
                                verbose = TRUE)))
  res <- suppressMessages(TOSTone(m=0.54,mu=0.5,sd=1.2,n=100,low_eqbound_d=-0.3, high_eqbound_d=0.3, alpha=0.05, plot = FALSE,
                 verbose = FALSE))
  expect_equal(res$diff, 0.04, tolerance = .0001)
  expect_equal(res$TOST_t1, 3.333333, tolerance = .0001)
  expect_equal(res$TOST_p1, 0.0006040021, tolerance = .0001)
  expect_equal(res$TOST_t2, -2.666667, tolerance = .0001)
  expect_equal(res$TOST_p2, 0.004474619, tolerance = .0001)
  expect_equal(res$TOST_df, 99, tolerance = .0001)
  expect_equal(res$alpha, 0.05, tolerance = .0001)
  expect_equal(res$low_eqbound, -0.36, tolerance = .0001)
  expect_equal(res$high_eqbound, 0.36, tolerance = .0001)
  expect_equal(res$low_eqbound_d, -0.3, tolerance = .0001)
  expect_equal(res$high_eqbound_d, 0.3, tolerance = .0001)
  expect_equal(res$LL_CI_TOST, -0.1592469, tolerance = .0001)
  expect_equal(res$UL_CI_TOST, 0.2392469, tolerance = .0001)
  expect_equal(res$LL_CI_TTEST, -0.198106, tolerance = .0001)
  expect_equal(res$UL_CI_TTEST, 0.278106, tolerance = .0001)
})

test_that("Test that raw one-sample t-test output is same as previous version", {

  hush = function(code) {
    sink("NUL") # use /dev/null in UNIX
    tmp = code
    sink()
    return(tmp)
  }
  hush(suppressMessages(TOSTone.raw(m=0.52,mu=0.5,sd=0.5,n=300,
                                    low_eqbound=-0.1, high_eqbound=0.1, alpha=0.05,
                                    plot = TRUE,
                                    verbose = TRUE)))

  res <- suppressMessages(TOSTone.raw(m=0.52,mu=0.5,sd=0.5,n=300,low_eqbound=-0.1, high_eqbound=0.1, alpha=0.05, plot = FALSE,
                     verbose = FALSE))
  expect_equal(res$diff, 0.02, tolerance = .0001)
  expect_equal(res$TOST_t1, 4.156922, tolerance = .0001)
  expect_equal(res$TOST_p1, 0.00002108451, tolerance = .0001)
  expect_equal(res$TOST_t2, -2.771281, tolerance = .0001)
  expect_equal(res$TOST_p2, 0.002966762, tolerance = .0001)
  expect_equal(res$TOST_df, 299, tolerance = .0001)
  expect_equal(res$alpha, 0.05, tolerance = .0001)
  expect_equal(res$low_eqbound, -0.1, tolerance = .0001)
  expect_equal(res$high_eqbound, 0.1, tolerance = .0001)
  expect_equal(res$LL_CI_TOST, -0.02763041, tolerance = .0001)
  expect_equal(res$UL_CI_TOST, 0.06763041, tolerance = .0001)
  expect_equal(res$LL_CI_TTEST, -0.03680924, tolerance = .0001)
  expect_equal(res$UL_CI_TTEST, 0.07680924, tolerance = .0001)
})

test_that("Test that two-sample t-test output is same as previous version", {
  hush = function(code) {
    sink("NUL") # use /dev/null in UNIX
    tmp = code
    sink()
    return(tmp)
  }
  hush(suppressMessages(TOSTtwo(m1=5.25,m2=5.22,sd1=0.95,sd2=0.83,n1=95,n2=89,
                                low_eqbound_d=-0.43,high_eqbound_d=0.43, plot = TRUE,
                                var.equal =TRUE,
                                verbose = TRUE)))
  res <- suppressMessages(TOSTtwo(m1=5.25,m2=5.22,
                                  sd1=0.95,sd2=0.83,
                                  n1=95,n2=89,
                                  low_eqbound_d=-0.43,high_eqbound_d=0.43,
                                  plot = FALSE,
                 verbose = FALSE))
  expect_equal(res$diff, 0.03, tolerance = .0001)
  expect_equal(res$TOST_t1, 3.14973, tolerance = .0001)
  expect_equal(res$TOST_p1, 0.0009560083, tolerance = .0001)
  expect_equal(res$TOST_t2, -2.692771, tolerance = .0001)
  expect_equal(res$TOST_p2, 0.003875522, tolerance = .0001)
  expect_equal(res$TOST_df, 181.1344, tolerance = .0001)
  expect_equal(res$alpha, 0.05, tolerance = .0001)
  expect_equal(res$low_eqbound, -0.3835687, tolerance = .0001)
  expect_equal(res$high_eqbound, 0.3835687, tolerance = .0001)
  expect_equal(res$low_eqbound_d, -0.43, tolerance = .0001)
  expect_equal(res$high_eqbound_d, 0.43, tolerance = .0001)
  expect_equal(res$LL_CI_TOST, -0.1870843, tolerance = .0001)
  expect_equal(res$UL_CI_TOST, 0.2470843, tolerance = .0001)
  expect_equal(res$LL_CI_TTEST, -0.2290799, tolerance = .0001)
  expect_equal(res$UL_CI_TTEST, 0.2890799, tolerance = .0001)
})

test_that("Test that raw two-sample t-test output is same as previous version", {
  hush = function(code) {
    sink("NUL") # use /dev/null in UNIX
    tmp = code
    sink()
    return(tmp)
  }
  hush(suppressMessages({res= TOSTtwo.raw(m1=5.25,m2=5.22,sd1=0.95,sd2=0.83,n1=95,n2=89,
                                    low_eqbound=-0.384,high_eqbound=0.384, plot = TRUE,
                                    verbose = TRUE)}))
  res <- suppressMessages(TOSTtwo.raw(m1=5.25,m2=5.22,sd1=0.95,sd2=0.83,n1=95,n2=89,low_eqbound=-0.384,high_eqbound=0.384, plot = FALSE,
                     verbose = FALSE))
  expect_equal(res$diff, 0.03, tolerance = .0001)
  expect_equal(res$TOST_t1, 3.153015, tolerance = .0001)
  expect_equal(res$TOST_p1, 0.0009458745, tolerance = .0001)
  expect_equal(res$TOST_t2, -2.696056, tolerance = .0001)
  expect_equal(res$TOST_p2, 0.003838994, tolerance = .0001)
  expect_equal(res$TOST_df, 181.1344, tolerance = .0001)
  expect_equal(res$alpha, 0.05, tolerance = .0001)
  expect_equal(res$low_eqbound, -0.384, tolerance = .0001)
  expect_equal(res$high_eqbound, 0.384, tolerance = .0001)
  expect_equal(res$LL_CI_TOST, -0.1870843, tolerance = .0001)
  expect_equal(res$UL_CI_TOST, 0.2470843, tolerance = .0001)
  expect_equal(res$LL_CI_TTEST, -0.2290799, tolerance = .0001)
  expect_equal(res$UL_CI_TTEST, 0.2890799, tolerance = .0001)
  hush(suppressMessages({res <- TOSTtwo.raw(m1=5.25,m2=5.22,
                     sd1=0.95,sd2=0.83,n1=95,n2=89,
                     low_eqbound=-0.384,high_eqbound=0.384,
                     var.equal = TRUE, plot = FALSE)
  }))
})

test_that("Test that paired two-sample t-test output is same as previous version", {

  hush = function(code) {
    sink("NUL") # use /dev/null in UNIX
    tmp = code
    sink()
    return(tmp)
  }
  hush(suppressMessages(TOSTpaired(n=65,m1=5.83,m2=5.75,sd1=1.17,sd2=1.29,r12=0.75,low_eqbound_dz=-0.4,high_eqbound_dz=0.4,
                                   verbose = TRUE, plot = TRUE)))
  res <- suppressMessages(TOSTpaired(n=65,m1=5.83,m2=5.75,sd1=1.17,sd2=1.29,r12=0.75,low_eqbound_dz=-0.4,high_eqbound_dz=0.4,
                    verbose = FALSE, plot = FALSE))
  expect_equal(res$diff, 0.08, tolerance = .0001)
  expect_equal(res$TOST_t1, 3.960381, tolerance = .0001)
  expect_equal(res$TOST_p1, 0.00009531728, tolerance = .0001)
  expect_equal(res$TOST_t2, -2.489426, tolerance = .0001)
  expect_equal(res$TOST_p2, 0.00770235, tolerance = .0001)
  expect_equal(res$TOST_df, 64, tolerance = .0001)
  expect_equal(res$alpha, 0.05, tolerance = .0001)
  expect_equal(res$low_eqbound, -0.350782, tolerance = .0001)
  expect_equal(res$high_eqbound, 0.350782, tolerance = .0001)
  expect_equal(res$low_eqbound_dz, -0.4, tolerance = .0001)
  expect_equal(res$high_eqbound_dz, 0.4, tolerance = .0001)
  expect_equal(res$LL_CI_TOST, -0.1015433, tolerance = .0001)
  expect_equal(res$UL_CI_TOST, 0.2615433, tolerance = .0001)
  expect_equal(res$LL_CI_TTEST, -0.1372988, tolerance = .0001)
  expect_equal(res$UL_CI_TTEST, 0.2972988, tolerance = .0001)
})

test_that("Test that raw paired two-sample t-test output is same as previous version", {
  hush = function(code) {
    sink("NUL") # use /dev/null in UNIX
    tmp = code
    sink()
    return(tmp)
  }
  hush(suppressMessages(TOSTpaired.raw(n=65,m1=5.83,m2=5.75,sd1=1.17,sd2=1.30,r12=0.745,
                                       low_eqbound=-0.34,high_eqbound=0.34, plot = TRUE,
                                       verbose = TRUE)))
  res <- suppressMessages(TOSTpaired.raw(n=65,m1=5.83,m2=5.75,sd1=1.17,sd2=1.30,r12=0.745,
                        low_eqbound=-0.34,high_eqbound=0.34, plot = FALSE,
                        verbose = FALSE))
  expect_equal(res$diff, 0.08, tolerance = .0001)
  expect_equal(res$TOST_t1, 3.803437, tolerance = .0001)
  expect_equal(res$TOST_p1, 0.0001606103, tolerance = .0001)
  expect_equal(res$TOST_t2, -2.354508, tolerance = .0001)
  expect_equal(res$TOST_p2, 0.01081349, tolerance = .0001)
  expect_equal(res$TOST_df, 64, tolerance = .0001)
  expect_equal(res$alpha, 0.05, tolerance = .0001)
  expect_equal(res$low_eqbound, -0.34, tolerance = .0001)
  expect_equal(res$high_eqbound, 0.34, tolerance = .0001)
  expect_equal(res$LL_CI_TOST, -0.1043032, tolerance = .0001)
  expect_equal(res$UL_CI_TOST, 0.2643032, tolerance = .0001)
  expect_equal(res$LL_CI_TTEST, -0.1406022, tolerance = .0001)
  expect_equal(res$UL_CI_TTEST, 0.3006022, tolerance = .0001)
})

test_that("Test that correlation test output is same as previous version", {
  hush = function(code) {
    sink("NUL") # use /dev/null in UNIX
    tmp = code
    sink()
    return(tmp)
  }

  res <- suppressMessages(TOSTr(n=100, r = 0.02, low_eqbound_r=-0.3, high_eqbound_r=0.3, alpha=0.05, plot = FALSE,
               verbose = FALSE))
  expect_equal(res$r, 0.02, tolerance = .0001)
  expect_equal(res$TOST_p1, 0.0005863917, tolerance = .0001)
  expect_equal(res$TOST_p2, 0.002176282, tolerance = .0001)
  expect_equal(res$alpha, 0.05, tolerance = .0001)
  expect_equal(res$low_eqbound_r, -0.3, tolerance = .0001)
  expect_equal(res$high_eqbound_r, 0.3, tolerance = .0001)
  expect_equal(res$LL_CI_TOST, -0.145957, tolerance = .0001)
  expect_equal(res$UL_CI_TOST, 0.1848622, tolerance = .0001)
  expect_equal(res$LL_CI_TTEST, -0.1771139, tolerance = .0001)
  expect_equal(res$UL_CI_TTEST, 0.2155713, tolerance = .0001)

  hush(suppressMessages(TOSTr(n=100, r = 0.02, low_eqbound_r=-0.3, high_eqbound_r=0.3, alpha=0.05, plot = TRUE,
                             verbose = TRUE)))

})

test_that("Test that meta test output is same as previous version", {
  hush = function(code) {
    sink("NUL") # use /dev/null in UNIX
    tmp = code
    sink()
    return(tmp)
  }

  res <- suppressMessages(TOSTmeta(ES=0.12, se=0.09, low_eqbound_d=-0.2, high_eqbound_d=0.2, alpha=0.05, plot = FALSE,
                  verbose = FALSE))
  expect_equal(res$ES, 0.12, tolerance = .0001)
  expect_equal(res$TOST_Z1, 3.555556, tolerance = .0001)
  expect_equal(res$TOST_p1, 0.0001885906, tolerance = .0001)
  expect_equal(res$TOST_Z2, -0.8888889, tolerance = .0001)
  expect_equal(res$TOST_p2, 0.1870314, tolerance = .0001)
  expect_equal(res$alpha, 0.05, tolerance = .0001)
  expect_equal(res$low_eqbound_d, -0.2, tolerance = .0001)
  expect_equal(res$high_eqbound_d, 0.2, tolerance = .0001)
  expect_equal(res$LL_CI_TOST, -0.02803683, tolerance = .0001)
  expect_equal(res$UL_CI_TOST, 0.2680368, tolerance = .0001)
  expect_equal(res$LL_CI_ZTEST, -0.05639676, tolerance = .0001)
  expect_equal(res$UL_CI_ZTEST, 0.2963968, tolerance = .0001)

  hush(suppressMessages(TOSTmeta(ES=0.12, se=0.09, low_eqbound_d=-0.2, high_eqbound_d=0.2, alpha=0.05, plot = TRUE,
                                 verbose = TRUE)))
})

test_that("Test that two proportions test output is same as previous version", {
  hush = function(code) {
    sink("NUL") # use /dev/null in UNIX
    tmp = code
    sink()
    return(tmp)
  }
hush(suppressMessages(TOSTtwo.prop(prop1 = .65, prop2 = .70, n1 = 100, n2 = 100,
                                     low_eqbound = -0.1, high_eqbound = 0.1, alpha = .05,
                                     verbose = TRUE,
                                     plot = TRUE)))

  expect_warning(TOSTtwo.prop(prop1 = .65, prop2 = .70, n1 = 100, n2 = 100,
                              low_eqbound = 0.11, high_eqbound = 0.1, alpha = .05, plot = FALSE,
                              verbose = FALSE))
  expect_error(TOSTtwo.prop(prop1 = .65, prop2 = .70, n1 = 1, n2 = 100,
                            low_eqbound = -0.1, high_eqbound = 0.1, alpha = .05, plot = FALSE,
                            verbose = FALSE))
  expect_error(TOSTtwo.prop(prop1 = 1.01, prop2 = .70, n1 = 100, n2 = 100,
                            low_eqbound = -0.1, high_eqbound = 0.1, alpha = .05, plot = FALSE,
                            verbose = FALSE))
  expect_error(TOSTtwo.prop(prop1 = .65, prop2 = 2, n1 = 100, n2 = 100,
                            low_eqbound = -0.1, high_eqbound = 0.1, alpha = .05, plot = FALSE,
                            verbose = FALSE))
  expect_error(TOSTtwo.prop(prop1 = .65, prop2 = .7, n1 = 100, n2 = 100,
                            low_eqbound = -0.1, high_eqbound = 0.1, alpha = 1.5, plot = FALSE,
                            verbose = FALSE))

  res <- TOSTtwo.prop(prop1 = .65, prop2 = .70, n1 = 100, n2 = 100,
                      low_eqbound = -0.1, high_eqbound = 0.1, alpha = .05, plot = FALSE,
                      verbose = FALSE)
  expect_equal(res$dif, -0.05, tolerance = .0001)
  expect_equal(res$TOST_z1, 0.7559289, tolerance = .0001)
  expect_equal(res$TOST_p1, 0.2248459, tolerance = .0001)
  expect_equal(res$TOST_z2, -2.267787, tolerance = .0001)
  expect_equal(res$TOST_p2, 0.0116711, tolerance = .0001)
  expect_equal(res$alpha, 0.05, tolerance = .0001)
  expect_equal(res$low_eqbound, -0.1, tolerance = .0001)
  expect_equal(res$high_eqbound, 0.1, tolerance = .0001)
  expect_equal(res$LL_CI_TOST, -0.1587968, tolerance = .0001)
  expect_equal(res$UL_CI_TOST, 0.05879684, tolerance = .0001)
  expect_equal(res$LL_CI_ZTEST, -0.1796394, tolerance = .0001)
  expect_equal(res$UL_CI_ZTEST, 0.07963943, tolerance = .0001)
  expect_equal(res$NHST_z, -0.7559289, tolerance = .0001)
  expect_equal(res$NHST_p, 0.4496918, tolerance = .0001)
})

