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
