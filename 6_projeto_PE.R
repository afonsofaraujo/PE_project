a <- 1
b <- 9
c <- 7
d <- 20

#1.
um <- log10(1+1/a) + log10(1+1/b)

#2.
pos <- 0
for (i in c:d) {
  n_first <- as.integer(substr(2**i, 1, 1))
  if (n_first == a | n_first == b)
    pos <- pos + 1
}
dois <- pos/(d-c+1)

#3.
ans <- abs(um-dois)

#4.
ans_r <- round(ans, digits = 4)
print(ans_r)
