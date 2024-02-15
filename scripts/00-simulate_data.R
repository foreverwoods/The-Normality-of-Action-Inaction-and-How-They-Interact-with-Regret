#### Preamble ####
# Purpose: Simulates data that is similar to what is used
# Author: Janssen Myer Rambaud
# Date: February 15th, 2024
# Contact: janssen.rambaud@mail.utoronto.ca
# License: MIT
# Pre-requisites: None



#### Workspace setup ####
library(tidyverse)

#### Simulate data ####
set.seed(3)

# Table Simulation. reflects experiment 2's data
exp2_data <- tibble(
  norms = c("Action norms", "Inaction norms", "Control norms"),
  M_action_past_behaviour = runif(3, min = 1, max = 5),  # mean
  SD_action_past_behaviour = runif(3, min = 1, max = 2), # standard deviation
  N_action_past_behaviour = sample(40:60, 3),            # number of participants
  M_inaction_past_behaviour = runif(3, min = 1, max = 5),
  SD_inaction_past_behaviour = runif(3, min = 1, max = 2),
  N_inaction_past_behaviour = sample(40:60, 3)
)

# Print the tibble
head(exp2_data)


# Graph, reflects experiment 3's data

# Table simulation with experiment 3 data
exp3_data <- tibble(
  
  # use repeats to get four action/inaction columns split between action and inaction norms
  # the expectations are also repeated to reflect the action norms and past behaviour
  graph_norms = rep(c("Action norms", "Inaction norms"), 2),
  past_behaviours = rep(c("Action past behavior", "Inaction past behavior"), each = 2),
  expectations = rep(c("Action expectations", "Inaction expectations"), times = 2),
  perceived_regret = runif(4, min = 1, max = 5)
)

# create the graph 
ggplot(exp3_data, aes(x = past_behaviours, y = perceived_regret, fill = expectations)) +
  geom_bar(stat = "identity", position = position_dodge()) +
  
  # create the error bar like the photo
  geom_errorbar(aes(ymin = perceived_regret - runif(1, min = 0.1, max = 1), ymax = perceived_regret + runif(1, min = 0.1, max = 1)),
                width = 0.4, position = position_dodge(1)) +
  labs(x = "Behaviour", y = "Perceived regret for action", fill = "Expectations")


# tests, should all be TRUE
exp2_data$norms |>
  length() == 3
exp2_data$N_action_past_behaviour |>
  min() >= 40
exp2_data$N_action_past_behaviour |>
  max() <= 60
exp2_data$SD_inaction_past_behaviour |>
  length() == 3

