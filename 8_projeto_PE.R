library(tidyverse)
det
#Variables
set.seed(2021)
n <- 162
sca <- 1
loc <- 0.8
nu <- -0.5
sd <- sqrt(2)

# Cauchy distribution
cau <- rcauchy(n, loc, sca)
cau_sorted <- sort(cau)
q_cau <- numeric(n)
for (i in 1:n){
  q_cau[i] <- quantile(cau_sorted, i/(n+1))
}

# Normal distribution
nor <- rnorm(n, nu, sd)
nor_sorted <- sort(nor)
q_nor <- numeric(n)
for (i in 1:n){
  q_nor[i] <- quantile(nor_sorted, i/(n+1))
}


df <- data.frame(cbind(q_cau, cau_sorted, q_nor, nor_sorted))

colnames(df) <- c("Quantiles_Cauchy", "Sorted_Values_Cauchy", "Quantiles_Normal", "Sorted_Values_Normal")
print(df)

ggplot(df, aes(x = Quantiles_Cauchy, y = Sorted_Values_Cauchy)) +
  geom_line() +
  xlab("Quantis de probabilidade") +
  ylab("Valores gerados ordenados")
    
# Criar dataframe dos valores ordenados e quantis para Cauchy
df_cauchy <- data.frame(Quantiles = quantiles, Valores = sorted_cauchy)

# Criar dataframe dos valores ordenados e quantis para Normal
df_normal <- data.frame(Quantiles = quantiles, Valores = sorted_normal)

# Criar o gráfico utilizando ggplot2
ggplot() +
  geom_line(data = df_cauchy, aes(x = Quantiles, y = Valores), color = "blue") +
  geom_line(data = df_normal, aes(x = Quantiles, y = Valores), color = "red") +
  geom_abline(intercept = 0, slope = 1, linetype = "dashed") +
  xlab("Quantis de probabilidade") +
  ylab("Valores gerados ordenados") +
  +
  theme_bw() +
  scale_color_manual(values = c("blue", "red"), 
                     breaks = c("Cauchy", "Normal"),
                     labels = c("Distribuição de Cauchy", "Distribuição Normal"),
                     name = "Distribuição")