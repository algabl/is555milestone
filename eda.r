library(tidyverse)
library(dplyr)
library(splitstackshape)

education <- read_csv('~/rstudio/is555milestone1/07_train.csv')

education <- education %>% 
   
  janitor::clean_names()

education %>% 
  ggplot(aes(x = target)) +
  geom_bar()


education %>% 
  filter(curricular_units_2nd_sem_credited > curricular_units_2nd_sem_approved) %>% 
  select(curricular_units_2nd_sem_credited, curricular_units_2nd_sem_approved)
  
