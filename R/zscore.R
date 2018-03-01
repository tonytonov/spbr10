#' Zscore
#'
#' Compute z-scores
#'
#' @param x A numeric vector
#' @param na.rm A logical value indicating whether missing values should be removed
#'
#' @importFrom stats sd
#' @export
zscore <- function(x, na.rm = getOption("na.rm", FALSE)) {
  (x - mean(x, na.rm = na.rm)) / sd(x, na.rm = na.rm)
}
