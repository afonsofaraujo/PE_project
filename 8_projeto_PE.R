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


quantis_cauchy <- numeric(n)
for (i in 1:n){
  quantis_cauchy[i] <- quantile(sorted_cauchy, i/(n+1))
}

nor <- rnorm(n, nu, sd)
quantis_normal <- numeric(n)
for (j in 1:n){
  quantis_normal[j] <- quantile(nor, j/(n+1))
}

df <- data.frame(Quantiles_cau = quantis_cauchy, Quantiles_nor = quantis_normal, Valores = sorted_cauchy)


ggplot() +
  geom_point(data = df, aes(x = Valores, y = Quantiles_cau), color = "blue") +
  geom_point(data = df, aes(x = Valores, y = Quantiles_nor), color = "red") +
  geom_abline(intercept = 0, slope = 1, linetype = "dashed") +
  xlab("Valores gerados ordenados") +
  ylab("Quantis de probabilidade") +
  labs(title = "Distribuições") 
