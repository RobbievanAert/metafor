# Note: Works with "robust.rma" objects.

coef.summary.rma <- function(object, ...) {

   if (!inherits(object, "summary.rma"))
      stop("Argument 'object' must be an object of class \"summary.rma\".")

   x <- object

   if (inherits(x, "robust.rma")) ### so that code below works with x$zval
      x$zval <- x$tval

   res.table <- data.frame(estimate=x$b, se=x$se, zval=x$zval, pval=x$pval, ci.lb=x$ci.lb, ci.ub=x$ci.ub)

   if (is.element(x$test, c("knha","adhoc","t")))
      colnames(res.table)[3] <- "tval"

   return(res.table)

}
