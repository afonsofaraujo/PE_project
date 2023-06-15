library(tidyverse)
#Import
timeuse <- read.csv("R/PE_projeto/TIME_USE_24092022.csv")
#Data filtering + plot
timeuse %>% 
  filter(País != "África do Sul") %>% 
  filter(Sexo == "Total") %>% 
  filter(Ocupação == "Trabalho não remunerado" | Ocupação == "Lazer") %>%
  ggplot(aes(Ocupação, Tempo)) +
  geom_boxplot() +
  coord_flip() +
  labs(y = "Tempo médio diário (em minutos)") + 
  labs(x = "") +
  labs(title = "Tempo despendido em ocupações por Homens e Mulheres entre os 15-64 anos")