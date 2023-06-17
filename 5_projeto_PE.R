# variables
set.seed(1966)
n <- 1090
m <- 5000
p <- 0.4
# probability density function
f <- array(NA, m)

for (i in 1:1:m){
  f[i] <- (1-p)**i*p
}
# distribution function
f_dist <- c(0, cumsum(f))

u <- runif(m)

x <- array(NA, m)
len <- 0

while (TRUE){
  for(i in 1:m) {
    for(j in 1:m) {
      if ((f_dist[j] < u[i]) & (u[i] <= f_dist[j+1])) {
      x[i] <- j
      }
    }
  x <- x[!is.na(x)]
  len <- length(x)
  if (len >= n){
    break
    }
  }
  break
}
# select greater than (average + standard deviation)
num_x <- array(NA, length(x))
for (i in 1:length(x)) {
  if (x[i] > mean(x) + sd(x)){
    num_x[i] <- x[i]
  }
}
# select greater than average
den_x <- array(NA, length(x))
for (i in 1:length(x)) {
  if (mean(x) > x[i]){
    den_x[i] <- x[i]
  }
}
# delete Na's
num_x <- num_x[!is.na(num_x)]
den_x <- den_x[!is.na(den_x)]
# answer
ans <- length(num_x)/length(den_x)
ans_r <- round(ans, digits = 4)
print(ans_r)

