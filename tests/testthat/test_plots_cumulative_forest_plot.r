### library(metafor); library(testthat); Sys.setenv(NOT_CRAN="true")

### see also: http://www.metafor-project.org/doku.php/plots:cumulative_forest_plot

context("Checking plots example: cumulative forest plot")

test_that("plot can be drawn.", {

   skip_on_cran()

   opar <- par(no.readonly=TRUE)

   ### decrease margins so the full space is used
   par(mar=c(4,4,1,2))

   ### load BCG vaccine data
   data(dat.bcg, package="metafor")

   ### calculate (log) relative risks and corresponding sampling variances
   dat <- escalc(measure="RR", ai=tpos, bi=tneg, ci=cpos, di=cneg, data=dat.bcg)

   ### fit random-effects models
   res <- rma(yi, vi, data=dat, slab=paste(author, year, sep=", "))

   ### cumulative meta-analysis (in the order of publication year)
   tmp <- cumul(res, order=order(dat$year))

   ### cumulative forest plot
   forest(tmp, xlim=c(-4,2), at=log(c(.125, .25, .5, 1, 2)),
          atransf=exp, digits=c(2,3), cex=.75)

   ### switch to bold font
   par(cex=.75, font=2)

   ### add column headings to the plot
   text(-4, 15, "Author(s) and Year", pos=4)
   text( 2, 15, "Rel. Risk [95% CI]", pos=2)

   par(opar)

})

test_that("plot can be drawn.", {

   skip_on_cran()

   opar <- par(no.readonly=TRUE)

   ### decrease margins so the full space is used
   par(mar=c(4,4,1,2))

   ### load BCG vaccine data
   data(dat.bcg, package="metafor")

   ### fit fixed-effects models using the Mantel-Haenszel method
   res <- rma.mh(measure="RR", ai=tpos, bi=tneg, ci=cpos, di=cneg, data=dat.bcg, slab=paste(author, year, sep=", "))

   ### cumulative meta-analysis (in the order of publication year)
   tmp <- cumul(res, order=order(dat.bcg$year))

   ### cumulative forest plot
   forest(tmp, xlim=c(-4,2), at=log(c(.125, .25, .5, 1, 2)),
          atransf=exp, digits=c(2,3), cex=.75)

   ### switch to bold font
   par(cex=.75, font=2)

   ### add column headings to the plot
   text(-4, 15, "Author(s) and Year", pos=4)
   text( 2, 15, "Rel. Risk [95% CI]", pos=2)

   par(opar)

})

test_that("plot can be drawn.", {

   skip_on_cran()

   opar <- par(no.readonly=TRUE)

   ### decrease margins so the full space is used
   par(mar=c(4,4,1,2))

   ### load BCG vaccine data
   data(dat.bcg, package="metafor")

   ### fit fixed-effects models using Peto's method
   res <- rma.peto(ai=tpos, bi=tneg, ci=cpos, di=cneg, data=dat.bcg, slab=paste(author, year, sep=", "))

   ### cumulative meta-analysis (in the order of publication year)
   tmp <- cumul(res, order=order(dat.bcg$year))

   ### cumulative forest plot
   forest(tmp, xlim=c(-4,2), at=log(c(.125, .25, .5, 1, 2)),
          atransf=exp, digits=c(2,3), cex=.75)

   ### switch to bold font
   par(cex=.75, font=2)

   ### add column headings to the plot
   text(-4, 15, "Author(s) and Year", pos=4)
   text( 2, 15, "Rel. Risk [95% CI]", pos=2)

   par(opar)

})
