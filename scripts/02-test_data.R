#### Preamble ####
# Purpose: Tests cleaned analysis data.
# Author: Janssen Myer Rambaud
# Date: February 15th, 2024
# Contact: janssen.rambaud@mail.utoronto.ca
# License: MIT
# Pre-requisites: Run 01-data_cleaning.R


#### Workspace setup ####
library(tidyverse)


#### Test the data ####
# num participants in exp 2 = 300, 303 for exp3

test_exp2_data <- read_csv("data/analysis_data/analysis_data_exp2.csv")

test_exp2_data$aa_int1 |>
  length() == 300


test_exp3_data <- read_csv("data/analysis_data/analysis_data_exp3.csv")

test_exp3_data$aa_int1 |>
  length() == 303

