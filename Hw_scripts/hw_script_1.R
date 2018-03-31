surveys <- portal_data_joined
library(tidyverse)
library(ggplot2)
head(surveys)
library(gridExtra)

ggplot(surveys,
                             aes(x=species_id, y=weight))+
  geom_boxplot() + xlab("Species") + ylab("weight")

survey_2 <- select(surveys, plot_id, species_id)
ggplot(survey_2, aes(x=species_id, y=plot_id))+
  geom_point(alpha=.01)
rodents <- select(surveys, taxa, hindfoot_length, weight) %>%
  select(surveys, taxa=Rodent)

