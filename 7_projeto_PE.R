#Variables
m <- 1803
n <- 17
prob <- 0.35
#Simulation
set.seed(1967)
sim <- numeric(m)
for (i in 1:m){
  dist <- rnorm(n)
  sim[i] <- sum(dist**2)
}
#Quantile
exp <- as.numeric(quantile(sim, prob, type = 2))
teo <- qchisq(prob, n)
#Deviation
ans <- abs(exp-teo)
ans_r <- round(ans,4)
print(ans_r)