cleanData <- function(rawData) { 
  cleanedData <- data.frame(rawData$demographics)
  cleanedData$DateOfBirth <- as.Date(cleanedData$DateOfBirth)
  cleanedData$Age <- as.numeric(difftime(Sys.Date(), cleanedData$DateOfBirth, units = "weeks"))/52.25
  cleanedData$Race <- na_if(cleanedData$Race, 'NA') 
  cleanedData <- cleanedData[!is.na(cleanedData$Race),]
  
  factors <- c('Gender', 'Race', 'LanguageDesc', 'WrittenLanguage', 'MaritalStatus', 'USCitizen')
  cleanedData[factors] <- lapply(cleanedData[factors], factor)
  
  eligibility <- data.frame(rawData$eligibility)
  dateColumns <- c('BenefitMonth', 'DerivedEndDate','ProgramApplicationDt')
  eligibility[dateColumns] <- lapply(eligibility[dateColumns], as.Date)
  
  starts <- eligibility[ ,c('id', 'BenefitMonth')]
  starts <- starts %>% group_by(id) %>% top_n(-1, BenefitMonth) 
    
  ends <-  eligibility[ ,c('id', 'DerivedEndDate')]
  ends <- ends %>% group_by(id) %>% top_n(1, DerivedEndDate) 
  
  eligibility <- left_join(starts, ends, by = 'id')
  eligibility <- rename(eligibility, startBenefit = BenefitMonth)
  eligibility <- rename(eligibility, endBenefit = DerivedEndDate)
  
  cleanedData <- left_join(cleanedData, eligibility, by = 'id')
  
  failures <-data.frame(rawData$`failure reasons`)
  dateColumns <- c('ProgramApplicationDt', 'BenefitMonth', 'DerivedEndDate', 'CloseEffectiveDate')
  failures[dateColumns] <- lapply(failures[dateColumns], as.Date)
  
  # note: seeking to filter HRFs...
  failures <- failures %>% group_by(id) %>% filter (RecordDescription == 'HRF')
  # create dependent variable
  failures <- failures %>% mutate(depVar = ifelse(FailedTest == 822, 1, 0))
  # there is a chance to harmonize dates here which I think is not necessary
  failureColumns <- c('id', 'depVar')
  failures <- failures[ , c('id', 'depVar')]
  
  cleanedData <- left_join(failures, cleanedData, by = 'id')
  
  return(cleanedData)
}