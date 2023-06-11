# variables
s <- 1832 
n <- 1128
p <- 0.45
# probability density function
f <- array(NA, n)
for (i in 1:1:n){
  f[i] <- (1-p)**i*p
}
# distribution function
f_dist <- c(0, cumsum(f))
# vector of random values in uniform distribution [0;1]
set.seed(s)
u <- runif(n)
# 
x <- array(NA, n)
for(i in 1:n) {
  for(j in 1:n) {
    if ((f_dist[j] < u[i]) & (u[i] <= f_dist[j+1])) {
      x[i] <- j
      
    }
  }
}
# delete Na's
length(x)
x <- x[!is.na(x)]
length(x)
# check info
table(x)
mean(x)
sd(x)
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
length(num_x)
length(den_x)
resposta <- length(num_x)/length(den_x)
resposta

