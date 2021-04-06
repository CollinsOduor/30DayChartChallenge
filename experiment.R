library(ggplot2)

sample_1 <- c(63, 63, 64, 62, 65, 59, 61, 62, 60, 60)
sample_2 <- c(59, 62, 59, 58, 59, 53, 76, 69, 54, 59)
sample_3 <- c(59, 63, 54, 63, 59, 67, 62, 54, 59, 58)

full_sample <- c(sample_1, sample_2, sample_3)

bootstrapping <- function() {
  samples <- c()
  for(time in 1:10000) {
    temp <- sample(full_sample, 20, replace = TRUE)
    samples <- c(samples, mean(temp))
  }
  return(samples)
}

samples <- bootstrapping()

rands <- rnorm(1000000, 60, sd(samples))

df <- data.frame(rands)

ggplot(data=df, aes(x=rands)) + geom_histogram(binwidth=.5)

ggsave('./experiment.png')
