russian.proverbs <- c("When you rush, you make people laugh.", "Measure seven times, cut once.",
                      "A spoken word is not a sparrow. Once it flies out, you can't catch it.",
                      "Work is not a wolf – it won’t run away to the forest.",
                      "Don’t blame a mirror for your ugly face.", "Don’t go to another monastery with your own rules.",
                      "An old friend is better than two new friends.", "Wait, be patient – you’ll love your partner eventually.",
                      "Trust; but verify.")

#' Stalin Sort
#' 
#' An R implementation of the stalin sort algorithm.
#' 
#' Elements out of order are systematically eliminated.
#' 
#' @param x an array or vector to be sorted.
#' @param decreasing logical. Should the sort be increasing or decreasing?
#' @returns a stalin'ized version of \code{x}, as a vector.
#' @export
stalin.sort <- function(x, decreasing=FALSE, verbose=TRUE) {
  # x is an array or vector to be sorted.
  # decreasing is a logical (TRUE or FALSE), indicating whether
  # the sort is increasing or decreasing
  if (!is.logical(decreasing)) {
    stop("Type `stalin.sort`, and try again, big guy.")
  }
  x <- as.vector(x)
  x.cmp <- x[1]
  if (decreasing) {
    cmp <- function(a, b) {
      return(a >= b)
    }
  } else {
    cmp <- function(a, b) {
      return(a <= b)
    }
  }
  for (i in 1:length(x)) {
    if (cmp(x[i], x.cmp)) {
      x.cmp <- x[i]
    } else {
      if (verbose) {
        print(paste(russian.proverbs[sample(1:length(russian.proverbs), 1)], sprintf("To the gulag with %s!", x[i])))
      }
      x[i] <- NaN
    }
  }
  return(x[!is.nan(x)])
}