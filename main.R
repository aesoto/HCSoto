# Meeting with HC
# By: AESoto
# 7 March 2022

publicationLibraries <- c('data.table', 'dplyr', 'tidyr', 'lubridate', 'purrr', 'bizdays', 'here', 'stringr', 'readxl')
lapply(publicationLibraries, require, character.only=TRUE)
#'xlsx',  'writexl', 'rowr', 'XLConnect'

source(here('functions', 'mainFuncs.R'))

if (sys.nframe() == 0) {
  main()
}
