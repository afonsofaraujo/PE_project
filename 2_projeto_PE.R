library(tidyverse)

#Import
timeuse <- read.csv("R/PE_projeto/TIME_USE_24092022.csv")

#Data filtering + plot
timeuse %>% 
  filter(País != "África do Sul") %>% 
  filter(Sexo == "Mulheres") %>% 
  filter(Ocupação == "Trabalho remunerado ou estudo" | Ocupação == "Cuidados pessoais") %>%
  ggplot(aes(Ocupação, Tempo)) +
  geom_boxplot() +
  coord_flip() +
  labs(y = "Tempo médio diário (em minutos)") + 
  labs(x = "") +
  labs(title = "Tempo despendido em ocupações por Mulheres entre os 15-64 anos")