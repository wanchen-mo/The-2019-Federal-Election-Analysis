library(haven)
library(tidyverse)

# Read in the raw data (You might need to change this if you use a different dataset)
raw_data <- read_dta("2019 Canadian Election Study - Online Survey v1.0.dta")
raw_data <- labelled::to_factor(raw_data)
raw_data
reduced_data <- 
  raw_data %>% 
  select(cps19_gender,cps19_education,cps19_votechoice,cps19_yob, cps19_v_likely,
         cps19_province, cps19_fed_gov_sat, cps19_fed_id, cps19_income_cat)

reduced_data$cps19_yob <- as.numeric(reduced_data$cps19_yob)
reduced_data$cps19_age <- (2019 - (reduced_data$cps19_yob+ 1919))
summary(reduced_data)
ggplot(reduced_data, aes(cps19_education)) + geom_bar()+ coord_flip()

write_csv(reduced_data, "clean_surveydata.csv")
