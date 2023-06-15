set.seed(1436)
m <- 250                # number of samples
n <- 49                 # size of samples
h_null <- 69.9          # expected value h_null
h_alt <- 71.4           # expected value h_alt
sigma2 <- 4             # Variance
alpha <- 0.08           # significance level
# Sample generation
samples <- matrix(rnorm(m * n, mean = h_alt, sd = sqrt(sigma2)), ncol = n)
# Test statistics
test_statistics <- apply(samples, 1, function(x) sqrt(n) * (mean(x) - h_null) / sqrt(sigma2))
test_statistics         # show test statistics 
non_rejection_count <- sum(abs(test_statistics) <= qnorm(1 - (alpha/2)))
qnorm(1 - (alpha/2))    # limit
non_rejection_count
probability_non_rejection <- non_rejection_count / m
probability_non_rejection