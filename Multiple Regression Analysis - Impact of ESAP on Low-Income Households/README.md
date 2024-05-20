# Multiple Regression Analysis - Impact of Energy Assistance Programs on Low-Income Households 

- **Objective:** Examine the relationship between energy assistance programs and household income levels.

- **Data Source:** Residential Energy Consumption Survey (RECS) 2020.

- **Findings:** Significant positive relationship between energy assistance participation and lower income levels.

- **Additional Factors:** Explored the impact of household size, employment status, and race on energy assistance participation.

- **Conclusion:** Highlights the importance of targeting energy assistance programs towards low-income households to alleviate financial burdens.

  This project was conducted for an Economics Capstone course at California State University, Fullerton. See [Acknowledgements](#acknowledgements)

## Table of Contents

* [General Info](#general-information)
* [Research Paper](#research-paper)
* [Technologies Used](#technologies-used)
* [Features](#features)
* [Tables and Graphs](#Tables-and-Graphs)
* [Setup](#setup)
* [R Code](#R-code)
* [Usage](#usage)
* [Project Status](#project-status)
* [Acknowledgements](#acknowledgements)
* [Contact](#contact)

## General Information

- This project investigates the relationship between energy assistance programs and household income levels using data from the Residential Energy Consumption Survey (RECS) 2020. We analyzed whether households with lower income levels are more likely to participate in energy assistance programs, controlling for variables such as household size, employment status, and race. Our findings reveal a significant positive relationship between energy assistance participation and lower income levels, suggesting that these programs are effectively targeted towards low-income households. However, the influence of each additional factor on energy assistance participation varies, indicating the need for tailored program designs to address specific household needs. The results underscore the importance of targeting energy assistance programs towards low-income households to alleviate financial burdens potentially.

## Research Paper
For more detailed information, please refer to our research paper:
- [Multiple Regression Research Paper](https://github.com/katmiller00/R-Projects/blob/88f59082715a16a823f428afbd183131d6659471/Multiple%20Regression%20Analysis%20-%20Sleep%20Duration%20and%20Depression%20Frequency/Multiple%20Regression%20Research%20Paper.pdf)

## Technologies Used

- **R** version 4.4.0
  - tidyverse package version 2.0.0
  - stargazer package version 5.2.3
  - dplyr package version 1.1.4
  - tidyr package version 1.3.1
  - ggplot2 package version 3.5.1
  - janitor package version 2.2.0

## Features

- **Analysis of Energy Assistance Programs and Household Income Levels:** Investigated the relationship between energy assistance participation and household income levels using data from the RECS 2020.
- **Controlled Variables:** Considered additional factors such as household size, employment status, and race to better understand their impact on energy assistance participation.
- **Regression Analysis:** Utilized multiple regression analysis techniques to explore the relationship between energy assistance participation and household income levels while accounting for other variables.
- **Findings Interpretation:** Interpreted the results to highlight the implications for targeting energy assistance programs towards low-income households and alleviating financial burdens potentially.

## Tables and Graphs

#### Table 1
![Table 1](https://github.com/katmiller00/R-Projects/blob/7be3c19b46f9a3be7428501e8f6944c34626adb7/Multiple%20Regression%20Analysis%20-%20Impact%20of%20ESAP%20on%20Low-Income%20Households/Table%201.png)

#### Table 2
![Table 2](https://github.com/katmiller00/R-Projects/blob/7be3c19b46f9a3be7428501e8f6944c34626adb7/Multiple%20Regression%20Analysis%20-%20Impact%20of%20ESAP%20on%20Low-Income%20Households/Table%202.png)

#### Table 3
![Table 3](https://github.com/katmiller00/R-Projects/blob/7be3c19b46f9a3be7428501e8f6944c34626adb7/Multiple%20Regression%20Analysis%20-%20Impact%20of%20ESAP%20on%20Low-Income%20Households/Table%203.png)

#### Table 4
![Table 4](https://github.com/katmiller00/R-Projects/blob/7be3c19b46f9a3be7428501e8f6944c34626adb7/Multiple%20Regression%20Analysis%20-%20Impact%20of%20ESAP%20on%20Low-Income%20Households/Table%204.png)

#### Table 5
![Table 5](https://github.com/katmiller00/R-Projects/blob/7be3c19b46f9a3be7428501e8f6944c34626adb7/Multiple%20Regression%20Analysis%20-%20Impact%20of%20ESAP%20on%20Low-Income%20Households/Table%205.png)

#### Table 6
![Table 6](https://github.com/katmiller00/R-Projects/blob/7be3c19b46f9a3be7428501e8f6944c34626adb7/Multiple%20Regression%20Analysis%20-%20Impact%20of%20ESAP%20on%20Low-Income%20Households/Table%206.png)

#### Figure 1
![Figure 1](https://github.com/katmiller00/R-Projects/blob/7be3c19b46f9a3be7428501e8f6944c34626adb7/Multiple%20Regression%20Analysis%20-%20Impact%20of%20ESAP%20on%20Low-Income%20Households/Figure%201.png)

#### Figure 2
![Figure 2](https://github.com/katmiller00/R-Projects/blob/7be3c19b46f9a3be7428501e8f6944c34626adb7/Multiple%20Regression%20Analysis%20-%20Impact%20of%20ESAP%20on%20Low-Income%20Households/Figure%202.png)

## Setup
### Project Requirements/Dependencies

- **R** version 4.4.0
  - tidyverse package version 2.0.0
  - stargazer package version 5.2.3
  - dplyr package version 1.1.4
  - tidyr package version 1.3.1
  - ggplot2 package version 3.5.1
  - janitor package version 2.2.0
  
### Installation

1. **Install R**: [Download from CRAN](https://cran.r-project.org/).
2. **Install Packages**: Run in R:
    ```R
    install.packages(c("tidyverse", "stargazer", "dplyr", "tidyr", "ggplot2", "janitor"))
    ```
3. **Clone Repository**:
    ```bash
    git clone https://github.com/your-username/R-Projects.git
    ```
4. **Navigate to Project Folder**:
    ```bash
    cd D:/Multiple\ Regression\ Analysis\ -\ Impact\ of\ ESAP\ on\ Low-Income\ Households
    ```
### Getting Started

1. **Open RStudio** or your preferred R environment.
2. **Set Working Directory**:
    ```R
    setwd("path/to/project/folder")
    ```
3. **Run the Analysis**: Open `analysis.R` and run the code.

## R Code

For the complete R code used in this project, please refer to it here:
- [Multiple Regression R Code](https://github.com/your-username/R-Projects/blob/your-commit-hash/Multiple%20Regression%20Analysis%20-%20Sleep%20Duration%20and%20Depression%20Frequency/Multiple%20Regression%20R%20Code.R)

## Usage
Explore my project's functionalities with these examples:

### Example 1: Generate a Scatter Plot

1. **Load Libraries**:
    ```R
    library(ggplot2)
    ```
2. **Generate a Scatter Plot**:
    ```R
    ggplot(data = selected_data, aes(x = moneypy, y = energyasst_dummy)) +
      geom_point() +
      xlab("Gross Money Income") +
      ylab("Energy Assistance Received")
    ```
### Example 2: Perform a Linear Regression Analysis
1. **Perform Linear Regression**:
    ```R
    model <- lm(energyasst_dummy ~ moneypy, data = selected_data)
    summary(model)
    ```
## Project Status
Project is: *Completed* in December 2023

## Acknowledgements
- This project was inspired by the growing recognition of the significant impact of socioeconomic factors on household energy assistance reception among low-income households. We highlighted the importance of understanding the relationship between income levels and energy assistance access to inform policy and intervention strategies.
- Many thanks to my classmate, Mihika Kapoor, for her valuable contributions and support in creating this project.

## Contact
Kat Miller - katherine.s.miller@outlook.com & [LinkedIn](https://linkedin.com/in/katmiller00)
