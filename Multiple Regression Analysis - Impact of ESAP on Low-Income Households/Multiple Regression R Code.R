#Housekeeping
rm(list = ls())
setwd("D:\\ECON 490 Impact of ESAP on Low-Income Households")
library(stargazer)
library(tidyverse)
library(dplyr)
library(tidyr)
library(janitor)
library(ggplot2)
library(nnet)
library(car)

#Importing

df <- read.csv("recs2020.csv")


#Cleaning

df1 <- df %>% 
  janitor::clean_names()


#Removing Rows with Missing Values

new_df <- df1 %>% na.omit()


#Removing Duplicate Rows

new_df2 <- new_df %>% distinct(.keep_all=TRUE)


#Filtering

data_california <-  new_df2 %>% filter(state_name == "California")

selected_data <- data_california %>%
  select(moneypy, employhh, householder_race, nhsldmem, scaleb, energyasst)

selected_data <- na.omit(selected_data)


#Mutating variables

#moneypy

selected_data <- selected_data %>%
  mutate(moneypy = case_when(
    moneypy %in% c("1", "2", "3", "4", "5", "6", "7", "8", "9", "10") ~ "VERY LOW-INCOME",
    moneypy %in% c("11", "12", "13") ~ "LOW-INCOME",
    moneypy %in% c("14", "15", "16") ~ "MEDIAN AND ABOVE INCOME",
    TRUE ~ NA_character_
  ))

#employhh 

selected_data <- selected_data %>%
  mutate(employhh_dummy = ifelse(employhh %in% c("1", "2"), 1, 0))

#scaleb

selected_data <- selected_data %>%
  mutate(scaleb_dummy = ifelse(scaleb %in% c("1", "2", "3"), 1, 0))

#energyasst

selected_data <- selected_data %>%
  mutate(energyasst_dummy = ifelse(energyasst %in% c("1"), 1,
                                   ifelse(energyasst %in% c("0", "-2"), 0, NA_integer_)))
#householder_race

selected_data <- selected_data %>%
  mutate(householder_race = case_when(
    householder_race %in% c("1") ~ "White",
    householder_race %in% c("2") ~ "Black or African/American",
    householder_race %in% c("4") ~ "Asian",
    TRUE ~ NA_character_
  )) 


#Checking Types

class(selected_data$moneypy)

sapply(selected_data %>% select(energyasst, moneypy, scaleb, employhh, nhsldmem, householder_race), class)


#Factoring Variables After Levels Said "null"

selected_data$moneypy <- factor(selected_data$moneypy, levels = c("LOW-INCOME", "VERY LOW-INCOME", "MEDIAN AND ABOVE INCOME"))
selected_data$householder_race <- factor(selected_data$householder_race, levels = c("White", "Black or African/American", "Asian"))


#Collinearity

library(car)
vif(model5)


#Linear Regression

model <- lm(energyasst_dummy ~ moneypy, data = selected_data)
summary (model)
confint(model)
stargazer(model, type="text",
          keep.stat = c("n", "adj.rsq")) 

summary(model)


#Multiple Regression

model2 <- lm(energyasst_dummy ~ moneypy + scaleb_dummy, data = selected_data)
stargazer(model, model2, type="text",
          keep.stat = c("n", "adj.rsq"))

model3 <- lm(energyasst_dummy ~ moneypy + scaleb_dummy + employhh_dummy, data = selected_data)
stargazer(model, model2, model3, type="text",
          keep.stat = c("n", "adj.rsq"))

model4 <- lm(energyasst_dummy ~ moneypy + scaleb_dummy + employhh_dummy + nhsldmem, data = selected_data)
stargazer(model, model2, model3, model4, type="text",
          keep.stat = c("n", "adj.rsq"))

model5 <- lm(energyasst_dummy ~ moneypy + scaleb_dummy + employhh_dummy + nhsldmem + householder_race, data = selected_data)
stargazer(model, model2, model3, model4, model5, type="text",
          keep.stat = c("n", "adj.rsq"))


#Interactions

model_without_interaction <- lm(energyasst_dummy ~ moneypy + householder_race + scaleb_dummy + employhh_dummy + nhsldmem, data = selected_data)
summary(model_without_interaction)


#Function to Calculate Mean and Standard Deviation for Each Response Code

calculate_stats <- function(data, var_name) {
  stats <- data %>%
    group_by(!!sym(var_name)) %>%
    summarise(mean = mean(!!sym(var_name)), sd = sd(!!sym(var_name)))
  return(stats)
}


#Creating a List to Store Statistics for Each Variable

stats_list <- list()


#Looping Through Each Column Except The Character Variable Columns

for (col in names(selected_data)[sapply(selected_data, is.numeric)]) {
  stats_list[[col]] <- calculate_stats(selected_data, col)
}

#Viewing Statistics for Each Variable

for (i in 1:length(stats_list)) {
  cat("Variable:", names(stats_list[i]), "\n")
  print(stats_list[[i]])
  cat("\n")
}


#Extracting Numerical Variables Only

numerical_data <- selected_data[sapply(selected_data, is.numeric)]


#Calculating Mean and Standard Deviation for Each Variable

summary_stats <- sapply(numerical_data, function(x) c(Mean = mean(x, na.rm = TRUE), SD = sd(x, na.rm = TRUE)))


#Creating Summary Statistics Table

selected_data %>%
  select(energyasst, moneypy, scaleb, employhh, nhsldmem, householder_race, scaleg, totalbtu ) %>%
  as.data.frame() %>% 
  stargazer(type = 'text', digits = 2, median=TRUE)


#Relationship Between Income and Assistance Received

ggplot(selected_data, aes(x = moneypy, y = factor(energyasst), fill = factor(energyasst))) +
  stat_summary(geom = "bar", fun = "mean") +
  xlab("gross money income") +
  ylab("energy assistance received") +
  ggtitle("Relationship between income and assistance") +
  theme_minimal()


#Correlation

corr_moneypy_energyasst <- selected_data %>%
  mutate(moneypy_numeric = as.numeric(moneypy)) %>%
  select(moneypy_numeric, energyasst_dummy) %>%
  {cor(.$moneypy_numeric, .$energyasst_dummy)}

print(corr_moneypy_energyasst)



