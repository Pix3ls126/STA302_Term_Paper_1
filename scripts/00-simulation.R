#### Preamble ####
# Purpose: Simulated test date for the number of motor vehicle thefts in the city of Toronto in 2023
# Author: Aaron Xiaozhou Liu
# Date: January 21, 2024
# Contact: aaronxiaozhou.liu@mail.utoronto.ca
# Prerequisites: None

#### Workspace setup ####
#install.packages("tidyverse")
#install.packages("janitor")

library(tidyverse)
library(janitor)
library(dplyr)

#### simulate the data by reported motor theft by police division ####
#based on code from: https://tellingstorieswithdata.com/02-drinking_from_a_fire_hose.html#simulate

simulated_data <-
  tibble(
    # Use 1 through to 18 to represent each division
    "Division" = 1:18,
    # Randomly pick an option, with replacement, 151 times
    "Crime location" = sample(
      x = c("Garage", "Parking Lot", "Highway", "Streets/roads", "Construction site", "other"),
      size = 18,
      replace = TRUE
    )
  )

