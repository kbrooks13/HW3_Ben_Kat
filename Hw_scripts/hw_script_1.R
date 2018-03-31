surveys <- portal_data_joined
library(tidyverse)
library(ggplot2)
head(surveys)
library(gridExtra)
ggplot(surveys,
                             aes(x=species_id, y=weight))+
  geom_boxplot() + xlab("Species") + ylab("weight")
