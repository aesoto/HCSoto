calcData <- function(cleanedData) { 
  #probit Model
  probitMod <- glm(depVar ~ Gender + Age + Race + LanguageDesc + WrittenLanguage + EducationLevel + MaritalStatus, data=cleanedData, family=binomial(link="probit"))  
  #define testData
  predicted <- predict(probitMod, testData, type="response")
  summary(probitMod)
  
  
  #logit Model
  logitMod <- glm(admit ~ gre + gpa + rank, data = mydata, family = "binomial")
  
  return(results)
}