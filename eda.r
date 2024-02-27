library(tidyverse)
library(dplyr)
library(splitstackshape)

# q: how could i reference an external file that contains my working directory?
# a: i could use the source() function to reference an external file that contains my working directory
path <- readLines("path.txt")

setwd(path)

education <- read_csv('07_train.csv')

education <- education %>% 
  janitor::clean_names()

education %>% 
  ggplot(aes(x = target)) +
  geom_bar()


education %>% 
  filter(curricular_units_2nd_sem_credited > curricular_units_2nd_sem_approved) %>% 
  select(curricular_units_2nd_sem_credited, curricular_units_2nd_sem_approved)

education |> 
  # select where it contains credited
  select(starts_with("curricular_units_")) |> 
  pivot_longer(cols = everything(), names_to = "name", values_to = "units") |> 
  ggplot(aes(x = units)) +
  geom_density() +
    facet_wrap(~name, scales = "free")

education |> 
  select(starts_with("curricular_units_")) |> 
  # get summary stats (mean, median, etc) on each of these columns
  summary()

education |> 
  filter(curricular_units_1st_sem_without_evaluations > 0 | curricular_units_2nd_sem_without_evaluations > 0) |> 
  summary()
  