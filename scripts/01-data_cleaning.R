#### Preamble ####
# Purpose: Cleans the raw plane data recorded by Gilad Feldman. Saves cleaned data as 'analysis_data_exp1' and 'analysis_data_exp2' in data/analysis_data.
# Author: Janssen Myer Rambaud
# Date: February 15th, 2024
# Contact: janssen.rambaud@mail.utoronto.ca
# License: MIT
# Pre-requisites: NONE

#### Workspace setup ####
library(tidyverse)

#### Clean data ####
raw_data_exp2 <- read_csv("data/raw_data/exp2_raw.csv")
raw_data_exp3 <- read_csv("data/raw_data/exp3_raw.csv")

cleaned_data2 <-
  raw_data_exp2 |>
  janitor::clean_names() |>
  select(-age, -gender)

cleaned_data3 <-
  raw_data_exp3 |>
  janitor::clean_names() |>
  select(-aa_joy, -ai_joy, -ia_joy, -ii_joy, -age, -gender)



#### Save data ####
write_csv(cleaned_data2, "data/analysis_data/analysis_data_exp2.csv")
write_csv(cleaned_data3, "data/analysis_data/analysis_data_exp3.csv")

