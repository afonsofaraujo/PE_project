lambda <- 7.5
n <- 2961

#Random Exponential Distribuition
set.seed(3635)
obs <- rexp(n, lambda)
T <- ceiling(sum(obs))

#Cumulative sum of time intervals
obs_time <- vector("numeric", length = length(obs))
cumulative_sum <- 0

for (i in 1:length(obs)) {
  cumulative_sum <- cumulative_sum + obs[i]
  obs_time[i] <- cumulative_sum
}
#Number of events in unitary intervals
interval_counts <- table(cut(obs_time, breaks = seq(0, T, by = 1), include.lowest = TRUE))

#Deviation relative to lambda
ans <- abs(lambda-mean(interval_counts))
print(ans)