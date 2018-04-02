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

rodent_surveys <- select(surveys, taxa, sex, weight)
head(rodent_surveys)

rodent_surveys2 <- rodent_surveys %>% filter(!is.na(weight))
rodent_surveys <- rodent_surveys2 %>% filter (!is.na(sex))                     

rodent_surveys <- rodent_surveys %>% filter(taxa == "Rodent")
rodent_sex_weight <- rodent_surveys %>%
  group_by(sex) %>%
  summarise(mean_weight= round(mean(weight),digits=2))

mean_weight_bysex <- ggplot(rodent_sex_weight, aes(x=sex, y=mean_weight)) +
  geom_col()+xlab("SEX") + ylab("AVERAGE WEIGHT")

ggplot(rodent_sex_weight, aes(x=sex, y=mean_weight)) +
  geom_col()+xlab("SEX") + ylab("AVERAGE WEIGHT")

ggsave("figs/averageweightsex.png" ,mean_weight_bysex,width = 10, dpi=300)  
