getData <- function() {
  data.path <- '/home/andres/HCSoto/'
  file.name <- 'sampleData.xlsx'
  file <- paste0(data.path, file.name)
  sheets <- excel_sheets(file)

  rawData <- list()
  for(sheet in sheets){
    dataPanel <- read_excel(file, sheet=sheet)
    dataPanel <- select(dataPanel, -contains('Val'))
    dataPanel <- data.frame(dataPanel, stringsAsFactors = FALSE)
    rawData[[sheet]] <- dataPanel
  }
  return(rawData)  
}
