### Housekeeping
rm(list = ls())
setwd("D:\\Multiple Regression Analysis - Sleep Duration and Depression Frequency")
library(tidyverse)
library(stargazer) # pretty looking tables
library(dplyr)

################################################################################
#Load and prepare data
################################################################################

# Load data
data <- read.csv("nlsy.csv")

#Clean data 
new_data <- data %>% 
  select(sleep_hours_pernight,computer_hours_perweek,depressed_lastmo,hours_wk_yr,wage_sal)

#is.na(new_data)
new_data <- na.omit(new_data)
summary(new_data)

new_data <- new_data %>% 
  filter(computer_hours_perweek!="") %>% 
  filter(depressed_lastmo!="") %>%
  filter(wage_sal > 0) %>%  
  filter(hours_wk_yr > 0) %>%
  filter(sleep_hours_pernight > 0) %>%
  mutate(hrs_wk_pwk = hours_wk_yr/52) %>%
  mutate(lnwages = log(wage_sal))

new_data <- na.omit(new_data)

#Creating dummy variable for depression
new_data <- new_data %>% 
  mutate(depressed_lastmo = ifelse(depressed_lastmo=="None of the time",0,1)) 
  
#create dummy variable, 1 denoting some of the time and all of the time, 0 denoting none of the time
new_data$computer_hours_perweek <- ifelse(new_data$computer_hours_perweek =="None"|
                                            new_data$computer_hours_perweek =="Less than 1 hour a week"|
                                            new_data$computer_hours_perweek == "1 to 3 hours a week", 0, 1)

################################################################################
#Create Summary Statistics Table
################################################################################
new_data %>%
  select(-hours_wk_yr, -wage_sal) %>%
  as.data.frame() %>% 
  stargazer(type = 'text', digits = 2, median=TRUE)

################################################################################
#Relationship between sleep  and depression ratio
################################################################################

#Load necessary libraries
library(ggplot2)

ggplot(new_data, aes(x = sleep_hours_pernight, y = factor(depressed_lastmo), fill = factor(depressed_lastmo))) +
  stat_summary(geom = "bar", fun = "mean") +
  xlab("Sleep Hours Per Night") +
  ylab("Depressed Last Month") +
  ggtitle("Relationship between Sleep and Depression") +
  theme_minimal()

#Correlation
corr_depressed_lastmo_sleep_hours_pernight <- cor(new_data$sleep_hours_pernight, new_data$depressed_lastmo)

################################################################################
#Correlation Table
################################################################################

new_data %>% 
  select(sleep_hours_pernight,computer_hours_perweek,depressed_lastmo,hrs_wk_pwk, lnwages) %>% 
  cor() %>% 
  stargazer(type = 'text', digits = 2) 

################################################################################
#Regression analysis 
################################################################################

#Linear regression 
lm(formula = depressed_lastmo ~ sleep_hours_pernight, data=new_data)
model1 <- lm(depressed_lastmo ~ sleep_hours_pernight, data=new_data)
summary(model1)
confint(model1)
stargazer(model1, type="text",
          keep.stat = c("n", "adj.rsq"))

#Multiple regression analysis 
model2 <- lm(depressed_lastmo ~ sleep_hours_pernight + computer_hours_perweek, data=new_data)
stargazer(model1, model2, type="text",
          keep.stat = c("n", "adj.rsq"))
model3 <- lm(depressed_lastmo ~ sleep_hours_pernight + computer_hours_perweek + hrs_wk_pwk, data=new_data)
stargazer(model1, model2, model3, type="text",
          keep.stat = c("n", "adj.rsq"))
model4 <- lm(depressed_lastmo ~ sleep_hours_pernight + computer_hours_perweek + hrs_wk_pwk + lnwages, data=new_data)
stargazer(model1, model2, model3, model4, type="text",
          keep.stat = c("n", "adj.rsq"))

