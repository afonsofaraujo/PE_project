#1.
um <- log10(1+1/5) + log10(1+1/8)

#2.
pos <-0
for (i in 1:20) {
  n_first <- as.integer(substr(2**i, 1, 1))
  if (n_first == 5 | n_first == 8)
    pos <- pos + 1
}
dois <- pos/20

#3.
ans <- abs(um-dois)

#4.
ans_r <- round(ans, digits = 4)
print(ans_r)
