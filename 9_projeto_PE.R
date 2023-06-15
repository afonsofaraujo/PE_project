library(tidyverse)
set.seed(1236)
p <- 0.2
gama <- 0.98
n <- c(30, 50, 100, 200, 300, 500, 1000)  # Number of rows
k <- 2500                                 # Number of columns
# Allocation
differenceavg <- numeric(length(n))
root1 <- numeric(k)
root2 <- numeric(k)
lower <- numeric(k)
upper <- numeric(k)
for (j in 1:length(n)){
  # Generate a matrix of Bernoulli random variables
  matrix_data <- matrix(rbinom(n[j] * k, 1, 0.2), nrow = n[j])
  # Average of each column 
  xbar <- numeric(k)
  for (i in 1:k){
    xbar[i] <- mean(matrix_data[, i])
  }
  # Method 1
  z = qnorm((1 + gama)/2)
  for (i in 1:k){
    zeros <- Re(polyroot(c(1 + z^2/n[j], -2*xbar[i] - z^2/n[j], xbar[i]^2)))
    root1[i] <- zeros[1]
    root2[i] <- zeros[2]
  }
  # NA's to zeros
  root1[is.na(root1)] <- 0
  root2[is.na(root2)] <- 0
  comp1 <- root2 - root1
  # Method 2
  a = qnorm((1 + gama)/2)
  for (i in 1:k){
    lower[i] <- xbar[i] - a*sqrt((xbar[i]*(1 - xbar[i]))/n[j])
    upper[i] <- xbar[i] + a*sqrt((xbar[i]*(1 - xbar[i]))/n[j])
  }
  comp2 <- upper - lower
  differenceavg[j] <- mean(abs(comp2 - comp1))
}
df <- data.frame(n, differenceavg)
ggplot(df, aes(x = n, y = differenceavg)) +
  geom_point() +
  labs(x = "Tamanho das amostras", y = "Média das diferenças entre métodos") + 
  labs(title = "Comparação entre os métodos 1 e 2")