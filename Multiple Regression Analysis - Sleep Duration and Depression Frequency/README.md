# Multiple Regression Analysis - Sleep Duration and Depression Frequency
- **Objective:** Examine the relationship between sleep duration and depression.

- **Data Source:** National Longitudinal Survey of Youth (NLSY).

- **Findings:** Weak negative relationship; less sleep correlates with higher depression.

- **Additional Factors:** Considered computer time, hours worked, and wages; minimal impact on depression.

- **Conclusion:** Emphasizes the importance of healthy sleep habits in reducing depression risk.

This project was conducted for an Economic Research Methods course at California State University, Fullerton. See [Acknowledgements](#acknowledgements)

## Table of Contents

* [General Info](#general-information)
* [Research Paper](#research-paper)
* [Technologies Used](#technologies-used)
* [Features](#features)
* [Tables and Graphs](#Tables-and-Graphs)
* [Setup](#setup)
* [Usage](#usage)
* [Project Status](#project-status)
* [Acknowledgements](#acknowledgements)
* [Contact](#contact)

## General Information
- This project investigates the relationship between sleep duration and depression frequency using data from the National Longitudinal Survey of Youth (NLSY). We analyzed whether individuals who sleep fewer hours are more likely to experience depression, controlling for variables such as computer time, hours worked per week, and salary wages. Our findings indicate a weak negative relationship between sleep duration and depression frequency, suggesting that insufficient sleep is associated with a higher likelihood of depression. However, the influence of each variable on depression is minimal, highlighting the need for further research to consider additional factors like genetic predisposition, social support, and lifestyle. The results emphasize the importance of promoting healthy sleep habits to reduce depression risk potentially.

## Research Paper

For more detailed information, please refer to our research paper:

- [Multiple Regression Research Paper](Multiple%20Regression%20Analysis%20-%20Sleep%20Duration%20and%20Depression%20Frequency/Multiple%20Regression%20Research%20Paper.pdf)

## Technologies Used
- **R** version 4.4.0
  - tidyverse package version 2.0.0
  - stargazer package version 5.2.3
  - dplyr package version 1.1.4
  - ggplot2 package version 3.5.1

## Features
- **Analysis of Sleep Duration and Depression Frequency:** Investigated the relationship between sleep duration and depression frequency using data from the National Longitudinal Survey of Youth (NLSY).
- **Controlled Variables:** Considered additional factors such as computer time, hours worked per week, and salary wages to better understand their impact on depression.
- **Regression Analysis:** Utilized multiple regression analysis techniques to explore the relationship between sleep duration and depression while accounting for other variables.
- **Findings Interpretation:** Interpreted the results to highlight the implications for promoting healthy sleep habits and potentially reducing depression risk.

## Tables and Graphs

#### Summary Statistics
![ECON 340 Summary Statistics](https://github.com/katmiller00/R-Projects/assets/159479250/53791cb9-9f6f-4732-ac74-19c6df3322e7)

#### Bar Graph
![ECON 340 Bar Graph](https://github.com/katmiller00/R-Projects/assets/159479250/8ba27a15-42f8-4419-9625-27ca14ba39c4)

#### Linear Regression
![ECON 340 Linear Regression](https://github.com/katmiller00/R-Projects/assets/159479250/045a5b53-d283-4ee0-8f0d-26bdfe159f4b)

#### Multiple Regression
![ECON 340 Multiple Regression](https://github.com/katmiller00/R-Projects/assets/159479250/a3ec76fe-fb27-4b29-8218-1b0233762b5f)

## Setup
### Project Requirements/Dependencies

- R version 4.4.0
  - tidyverse package version 2.0.0
  - stargazer package version 5.2.3
  - dplyr package version 1.1.4
  - ggplot2 package version 3.5.1

### Installation

1. **Install R**: [Download from CRAN](https://cran.r-project.org/).
2. **Install Packages**: Run in R:
    ```R
    install.packages(c("tidyverse", "stargazer", "dplyr", "ggplot2"))
    ```
3. **Clone Repository**:
    ```bash
    git clone https://github.com/your-username/R-Projects.git
    ```
4. **Navigate to Project Folder**:
    ```bash
    cd R-Projects/Multiple\ Regression\ Analysis\ -\ Sleep\ Duration\ and\ Depression\ Frequency
    ```
### Getting Started

1. **Open RStudio** or your preferred R environment.
2. **Set Working Directory**:
    ```R
    setwd("path/to/project/folder")
    ```
3. **Run the Analysis**: Open `analysis.R` and run the code.

## Usage
Explore my project's functionalities with these examples:

### Example 1: Generate a Scatter Plot

1. **Load Libraries**:
    ```R
    library(ggplot2)
    ```
2. **Generate a Scatter Plot**:
    ```R
    ggplot(data = new_data, aes(x = sleep_hours_pernight, y = depressed_lastmo)) +
      geom_point() +
      xlab("Sleep Hours Per Night") +
      ylab("Depressed Last Month")
    ```
### Example 2: Perform a Linear Regression Analysis
1. **Perform Linear Regression**:
    ```R
    model <- lm(depressed_lastmo ~ sleep_hours_pernight, data = new_data)
    summary(model)
    ```
## Project Status
Project is: *Completed* in May 2023

## Acknowledgements
- This project was inspired by the growing recognition of the significant impact of sleep patterns on mental health outcomes and how other lifestyle factors could have an effect. We highlighted the importance of understanding the multifaceted nature of mental well-being and its relationship with various lifestyle aspects.
- Many thanks to my classmates, Mihika Kapoor and Lesly Cortez, for their valuable contributions and support in creating this project.
## Contact
Kat Miller - katherine.s.miller@outlook.com & https://linkedin.com/in/katmiller00


