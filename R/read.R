library(tuneR)

#' Read a wave file as a numeric vector with values between -1 and 1.
#'
#' @param file The file name
read.wav <- function(file) {
  chan <- tuneR::readWave(file)
  chan@left / chan@bit
}

#' Read a take from an LR-16 as a data frame of numeric vectors with
#' values between -1 and 1.
#'
#' @param directory Name of the directory for the take
read.lr16.take <- function(directory) {
  paths <- paste0(directory, .Platform$file.sep, sprintf('chan_%02d.wav', 1:16))
  muscles <- c('directions', 'microphone', 'this.muscle', 'that.muscle', 5:16)
  df <- as.data.frame(lapply(paths, read.wav))
  names(df) <- muscles
  df
}
