set.seed(1194)
m <- 100                # Número de amostras
n <- 45                 # Tamanho da amostra
mu_null <- 78.1         # Valor esperado sob a hipótese nula
mu_alternative <- 79.1  # Valor esperado sob a hipótese alternativa
sigma2 <- 4             # Variância
alpha <- 0.1            # Nível de significância
# Geração das amostras
samples <- matrix(rnorm(m * n, mean = mu_alternative, sd = sqrt(sigma2)), ncol = n)
# Estatísticas de teste
test_statistics <- apply(samples, 1, function(x) sqrt(n) * (mean(x) - mu_null) / sqrt(sigma2))
test_statistics
# Contagem de não rejeição da hipótese nula
non_rejection_count <- sum(abs(test_statistics) <= qnorm(1 - (alpha/2)))
qnorm(1 - (alpha/2)) # Valor limite
probability_non_rejection <- non_rejection_count / m
probability_non_rejection
