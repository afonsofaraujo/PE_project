library(ggplot2)

# Fixar a semente
set.seed(2021)

# Gerar amostra de Cauchy
sample_cauchy <- rcauchy(162, location = 0.8, scale = 1)

# Ordenar os valores gerados
sorted_cauchy <- sort(sample_cauchy)

# Calcular os quantis de probabilidade
quantiles <- seq(1/(162+1), 162/(162+1), length.out = 162)

# Gerar amostra de uma distribuição normal
sample_normal <- rnorm(162, mean = -0.5, sd = sqrt(2))

# Ordenar os valores gerados
sorted_normal <- sort(sample_normal)

# Criar dataframe dos valores ordenados e quantis para Cauchy
df_cauchy <- data.frame(Quantiles = quantiles, Valores = sorted_cauchy)

# Criar dataframe dos valores ordenados e quantis para Normal
df_normal <- data.frame(Quantiles = quantiles, Valores = sorted_normal)

# Criar o gráfico utilizando ggplot2
# Create the plot
# Create the plot with modified scales
ggplot() +
  geom_line(data = df_cauchy, aes(x = Quantiles, y = Valores, color = "Cauchy"), linetype = "solid") +
  geom_line(data = df_normal, aes(x = Quantiles, y = Valores, color = "Normal"), linetype = "solid") +
  geom_abline(intercept = 0, slope = 1, linetype = "dashed") +
  xlab("Quantis de probabilidade") +
  ylab("Valores gerados ordenados") +
  theme_bw() +
  scale_color_manual(values = c("blue", "red"), 
                     breaks = c("Cauchy", "Normal"),
                     labels = c("Distribuição de Cauchy", "Distribuição Normal"),
                     name = "Distribuição") +
  scale_x_continuous(breaks = seq(0, 1, by = 0.2),
                     labels = scales::percent_format(accuracy = 1)) +
  scale_y_continuous(breaks = seq(-10, 10, by = 2)) +
  theme(legend.position = "bottom")
