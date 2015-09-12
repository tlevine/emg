#' Subtract the mean and divide by the standard deviation
normalize <- function(xs) (xs - mean(xs)) / sd(xs)

#' Root mean square
rms <- function(xs) ((xs - mean(xs)) ^ 2) ^ 0.5
