#1.
um <- log10(1+1/1) + log10(1+1/9)

#2.
pos <-0
for (i in 7:20) {
  n_first <- as.integer(substr(2**i, 1, 1))
  if (n_first == 1 | n_first == 9)
    pos <- pos + 1
}
dois <- pos/14

#3.
ans <- abs(um-dois)

#4.
ans_r <- round(ans, digits = 4)
print(ans_r)
