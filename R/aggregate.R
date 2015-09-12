# It turns out that biomechanics textbooks and papers are rather unclear as to
# how to compute this stuff. They probably make sense if you already understand
# them though.

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



# Volume (decibels) by frequency tells us about fatigue; muscles work at lower frequencies as they fatigue. I guess we compute this with a Fourier transform?


# "EMG was sampled at 1,280 hz, and RMS EMG values were calculated at 10 hz." Ciccarelli & al, 2013
#
# "System noise was subtracted from non-normalized 10 Hz RMS EMG data (squared noise rMS subtracted from squared task RMS), which were normalized with the EMG MVE values. EMG data for each participant were processed to create graphical repsresentation of EMG amplitude of the right and left upper trapezius and the right wrist extensors." Ciccarelli & al, 2013
