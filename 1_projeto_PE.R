library(tidyverse)
library(readxl)
# Import
econ <- read_excel("R/PE_projeto/econ.xlsx")
# Data filtering
data1 <- subset(econ, select = c(tempo, ddesemp,gcp), format(tempo, "%Y-%m-%d") >= "1983-01-01")
# Normalization (standard) of variables
data1$ddesemp_sd <- scale(data1$ddesemp)
data1$gcp_sd <- scale(data1$gcp)
# Plot
ggplot(data1, aes(tempo)) + 
  geom_line(aes(y = gcp_sd, colour = "Gastos de consumo pessoal, em bili??es de d??lares.")) + 
  geom_line(aes(y = ddesemp_sd, colour = "Dura????o mediana do desemprego.")) +
  labs(x = "Ano") +
  labs(y = "Normaliza????o") +
  labs(title = 'Rela????o entre a dura????o mediana do desemprego e os gastos de consumo pessoal') +
  labs(color = "Legenda")