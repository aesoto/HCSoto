# main functions
source(here('functions', 'dateFuncs.R'))
source(here('functions', 'getFuncs.R'))
source(here('functions', 'cleanFuncs.R'))
source(here('functions', 'calcFuncs.R'))

main <- function() {
  start_time <- Sys.time()
  
  rawData <- getData()
  cleanedData <- cleanData(rawData)
  results <- calcData(cleanedData)
  
  end_time <- Sys.time()
  print('Processing time: ')
  print(end_time - start_time)
}
