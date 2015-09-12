#' Subtract the mean and divide by the standard deviation.
#'
#' The difference between normalized EMG of the same action by the same muscle
#' tells us how much more force the muscle is contributing in one situation than
#' in another situation.
#'
#' @param xs numeric vector
#' @returns numeric vector
normalize <- function(xs) (xs - mean(xs)) / sd(xs)

#' Root mean square
#' @param xs numeric vector
#' @returns numeric vector
rms <- function(xs) ((xs - mean(xs)) ^ 2) ^ 0.5


