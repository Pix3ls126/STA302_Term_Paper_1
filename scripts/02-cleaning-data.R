#### Preamble ####
# Purpose: Cleans the dataset downloaded from opendatatoronto
# Author: Aaron Xiaozhou Liu
# Date: January 22, 2024
# Contact: aaronxiaozhou.liu@mail.utoronto.ca
# Prerequisites: running 01-download_data.r

#### Workspace setup ####
#install.packages("tidyverse")
#install.packages("janitor")

library(tidyverse)
library(janitor)

# Read the raw data
raw_motor_theft_data = 
  read_csv(
    file = "inputs/raw_Theft_from_Motor_Vehicle.csv",
    show_col_types = FALSE
  )

# Clean the raw data
cleaned_motor_theft_data <-
  clean_names(raw_motor_theft_data)

# Converting month into it's numerical equivalent
# Done based off of https://www.reddit.com/r/Rlanguage/comments/m35q4i/comment/gqo21ql/?utm_source=share&utm_medium=web2x&context=3
cleaned_motor_theft_data$occ_month_num <- match(cleaned_motor_theft_data$occ_month, month.name)

# Combining occ_month, occ_day, and occ_year into one column
# Based off code from https://datacornering.com/how-to-join-year-month-and-day-into-a-date-in-r/
Full_date <- as.Date(ISOdate(year = cleaned_motor_theft_data$occ_year,
                month = cleaned_motor_theft_data$occ_month_num,
                day = cleaned_motor_theft_data$occ_day))

cleaned_motor_theft_data$full_occ_date <- Full_date

# Combine two columns into one
cleaned_motor_theft_data$location_and_premise_type <- paste(cleaned_motor_theft_data$location_type, "-",cleaned_motor_theft_data$premises_type)

# Filtering cleaned dataset for the desired columns and saving writing into a csv
filter_cleaned_motor_theft_data <- select(cleaned_motor_theft_data, event_unique_id, full_occ_date, occ_day, occ_month, occ_year, division, location_and_premise_type)

write_csv(
  x = dataset,
  file = "inputs/cleaned_Theft_from_Motor_Vehicle.csv"
)

