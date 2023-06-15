library(tidyverse)
library(readxl)
# Import
econ <- read_excel("R/PE_projeto/econ.xlsx")
# Data filtering
data1 <- subset(econ, select = c(tempo, ddesemp, gcp), format(tempo, "%Y-%m-%d") >= "1975-01-01")
# Normalization (standard) of variables
data1$ddesemp_std <- scale(data1$ddesemp)
data1$gcp_std <- scale(data1$gcp)
# Plot
ggplot(data1, aes(tempo)) + 
  geom_line(aes(y = gcp_std, colour = "Gastos de consumo pessoal, em biliões de dólares.")) + 
  geom_line(aes(y = ddesemp_std, colour = "Duração mediana do desemprego.")) +
  labs(x = "Ano") +
  labs(y = "Normalização") +
  labs(title = 'Relação entre a duração mediana do desemprego e os gastos de consumo pessoal') +
  labs(color = "Legenda")