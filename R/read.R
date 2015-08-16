library(tuneR)
unloadNamespace('tuneR')

#' Read a wave file into a numeric vector.
#'
#' @param file The file name
#' @returns The waveform as a numeric vector with values between -1 and 1
read.wav <- function(file, ...) {
  chan <- tuneR::readWave(file)
  chan@left / (2 ^ (chan@bit - 1) - 1)
}

#' Read a take from an LR-16 as a data frame of numeric vectors.
#'
#' @param directory Name of the directory for the take, like "Take_01"
#' @returns data.frame of 16 waveforms with values between -1 and 1,
#'   one from each wav file
read.lr16.take <- function(directory) {
  filenames <- sprintf('chan_%02d.wav', 1:16)
  paths <- paste0(directory, .Platform$file.sep, filenames)
  l <- lapply(paths, read.wav)
  names(l) <- filenames
  do.call(data.frame, l)
}
