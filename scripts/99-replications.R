#### Preamble ####
# Purpose: Replicate graphs from Feldman's research paper
# Date: February 15th, 2024
# Contact: janssen.rambaud@mail.utoronto.ca
# License: MIT
# Pre-requisites: None


# Load necessary libraries
library(tidyverse)

# Read the data from the CSV file
exp2_data <- read.csv("data/analysis_data/analysis_data_exp2.csv", header = TRUE, na.strings = "NA")

# Transform the data into the desired format

exp2_data_table <- tibble(
  norms = c("Action norms", "Inaction norms", "Control norms"),
  
  M_AP_Bvr = 
    c(mean(colMeans(exp2_data[c("aa_regret")], na.rm = TRUE)),
      mean(colMeans(exp2_data[c("ia_regret")], na.rm = TRUE)),
      mean(colMeans(exp2_data[c("ca_regret")], na.rm = TRUE))
      ),
  
  SD_AP_Bvr = 
    c(apply(exp2_data[c("aa_regret")], 2, sd, na.rm = TRUE),
      apply(exp2_data[c("ia_regret")], 2, sd, na.rm = TRUE),
      apply(exp2_data[c("ca_regret")], 2, sd, na.rm = TRUE)
    ),
  
  N_AP_Bvrr = 
    c(sum(!is.na(exp2_data[,c("aa_norms")])),
      sum(!is.na(exp2_data[,c("ia_norms")])),
      sum(!is.na(exp2_data[,c("ca_norms")]))
      ),
  
  M_IP_Bvr = 
    c(mean(colMeans(exp2_data[c("ai_regret")], na.rm = TRUE)),
      mean(colMeans(exp2_data[c("ii_regret")], na.rm = TRUE)),
      mean(colMeans(exp2_data[c("ci_regret")], na.rm = TRUE))
    ),
  
  SD_IP_Bvr = 
    c(apply(exp2_data[c("ai_regret")], 2, sd, na.rm = TRUE),
      apply(exp2_data[c("ii_regret")], 2, sd, na.rm = TRUE),
      apply(exp2_data[c("ci_regret")], 2, sd, na.rm = TRUE)
    ),
  
  N_IP_Bvr = 
    c(sum(!is.na(exp2_data[,c("ai_norms")])),
      sum(!is.na(exp2_data[,c("ii_norms")])),
      sum(!is.na(exp2_data[,c("ci_norms")]))
    )
)

# tibble

print(exp2_data_table)
write.table(exp2_data_table, "data/analysis_data/exp2_tibble.csv", sep=",", row.names = FALSE)


