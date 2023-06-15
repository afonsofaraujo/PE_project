library(tidyverse)
#Variables
set.seed(2021)
n <- 162 
sca <- 1
loc <- 0.8
nu <- -0.5
sd <- sqrt(2)
# Cauchy distribution
cau <- rcauchy(n, loc, sca)
sorted_cauchy <- sort(cau)
# Normal distribution
nor <- rnorm(n, nu, sd)
sorted_normal <- sort(nor)
quantis_cauchy <- numeric(n)
for (i in 1:n){
  quantis_cauchy[i] <- quantile(sorted_cauchy, i/(n+1))
}
quantis_cauchy
quantis_normal <- numeric(n)
for (j in 1:n){
  quantis_normal[j] <- quantile(sorted_normal, j/(n+1))
}
quantis_normal
# Criar dataframe dos valores ordenados e quantis para Cauchy
df_cauchy <- data.frame(Quantiles = quantis_cauchy, Valores = sorted_cauchy)
# Criar dataframe dos valores ordenados e quantis para Normal
df_normal <- data.frame(Quantiles = quantis_normal, Valores = sorted_normal)
# Plot
ggplot() +
  geom_line(data = df_cauchy, aes(x = Quantiles, y = Valores), color = "blue", size = 0.5) +
  geom_line(data = df_normal, aes(x = Quantiles, y = Valores), color = "red", size = 0.8) +
  geom_abline(intercept = 0, slope = 1, linetype = "dashed") +
  xlab("Quantis de probabilidade") +
  ylab("Valores gerados ordenados") +
  labs(title = "Distribuições") 


















