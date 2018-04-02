surveys <- portal_data_joined
library(tidyverse)
library(ggplot2)
head(surveys)
library(gridExtra)

ggplot(surveys,
                             aes(x=species_id, y=weight))+
  geom_boxplot() + xlab("Species") + ylab("weight")

tAxa <- unique(taxa)

num_taxa <- surveys %>% count(taxa) 

ggplot(num_taxa, aes(x=taxa, y=n)) +
geom_col() + xlab("taxa") + ylab("number of individuals")

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

rodent_count <- surveys %>% select(taxa, species_id)

rodent_count <- rodent_count %>% filter(taxa =="Rodent") %>% count(species_id)

ggplot(rodent_count, aes(x=species_id,y=n)) +
  geom_col()+xlab("number of individuals") + ylab("Species I.D.")

DM_data <- select(surveys, species_id, weight, hindfoot_length) %>% 
  filter(species_id == "DM") %>% filter(!is.na(weight)) %>% 
  filter(!is.na(hindfoot_length))

ggplot(DM_data, aes(x=weight, y=hindfoot_length)) + 
  geom_jitter(alpha=.1)
