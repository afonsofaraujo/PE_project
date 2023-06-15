#Variables
m <- 2736
n <- 17
prob <- 0.23
#Simulation
set.seed(1447)
sim <- numeric(m)
for (i in 1:m){
  dist <- rnorm(17)
  sim[i] <- sum(dist**2)
}
#Quantile
exp <- as.numeric(quantile(sim, prob, type = 2))
teo <- qchisq(prob, n)
#Deviation
ans <- abs(exp-teo)
ans_r <- round(ans, digits = 4)
print(ans_r)