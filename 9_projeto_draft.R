set.seed(1309)  # Set the seed for reproducibility

n_values <- c(30, 50, 100, 200, 300, 500, 1000)
p <- 0.2
k <- 3000

samples <- list()  # Create a list to store the generated samples

for (n in n_values) {
  sample_n <- matrix(rbinom(n * k, size = 1, prob = p), nrow = n, ncol = k)
  samples[[as.character(n)]] <- sample_n
}

# Print the first few elements of each sample
for (n in n_values) {
  print(head(samples[[as.character(n)]]))
}
