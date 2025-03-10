n <- 200

prime <- rep(T, n-1)
prime[1] = F

for (x in seq(2, sqrt(n))) {
  if (prime[x]) {
    for (m in seq(x*x, n, by=x)) {
      prime[m] = F
    }
  }
}
prime.count <- cumsum(prime)
index <- 1:n

plot.prime.count <- function() {
  par(mar = c(6, 6, 5, 3))
  plot(index, prime.count, type = 's', asp = 2,
       xlab = "n",
       ylab = expression(pi(n)),
       main = "Prime Counts for the First 200 Positive Integers")
}

plot.prime.count()

png("prime_counts_200.png", height = 400, width = 600, res = 100)
plot.prime.count()
dev.off()
