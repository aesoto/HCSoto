# HCSoto
Hennepin County

The Minnesota Family Investment Program (MFIP) helps families with children to meet basic needs, through food support and cash payments, while helping parents through employment training to achieve financial stability. Some households, particularly those that are working, are required to report these earnings monthly using a Household Report Form (HRF). Often this form or supplementary materials are not received in time to renew households on the program, which causes people in the household not to receive their benefits on time, and leads to an additional administrative burden for the county to restart these benefits.
When households do not submit forms in time, but are given benefits back later in the month, we consider this churn. Hennepin County would like to see if it is possible to reduce the churn for Monthly Reporters when cases close due to a potentially preventative reason (failure to file). 
This is historic data pulled from 2019, which shows the demographics of the head of household, their program eligibility over time (the months they are actively receiving benefits), and failure reasons, or when the MFIP program is closed for households, and why. There are 20 households in this data sample, but the population is 3,198 households or cases who received benefits in that year.
Data Dictionary of select variables
id: Case number for each household
ProgramApplicationDt: Date the household applied for MFIP
BenefitMonth: Month household could receive benefits for MFIP
DerivedEndDate: End of benefit month
ApprovalDate/ApprovalDtTm: Date/Time a decision is made on the case (can be approved or denied)
CloseEffectiveDate: Date a case is closed due to a denied application
FailedTest: Code associated with denial
FailedDescription: Description of the failed test code
RecordDescription: Type of form associated with the denial (can be an annual report or Monthly HRF)
