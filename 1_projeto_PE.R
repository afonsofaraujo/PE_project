library(readxl)

#Import
econ <- read_excel("R/econ.xlsx")

#Data filtering
data1 <- subset(econ, select = c(tempo, ddesemp,gcp), format(tempo, "%Y-%m-%d") >= "1983-01-01")

#Normalization (standard) of variables
data1$ddesemp_sd <-scale(data1$ddesemp)
data1$gcp_sd <-scale(data1$gcp)

#Plot
ggplot(data1, aes(tempo)) + 
  geom_line(aes(y = gcp_sd, colour = "Gastos de consumo pessoal, em biliões de dólares.")) + 
  geom_line(aes(y = ddesemp_sd, colour = "Duração mediana do desemprego.")) +
  labs(x = "Ano") +
  labs(y = "z_k standard")
