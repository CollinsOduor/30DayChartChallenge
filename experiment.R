#I saw a claim that matcboxes in Nairobi contain at least 60 sticks. I wanted to put this to the test

library(ggplot2)

#I went and bought a few matchboxes, to treat as samples (Each package has 10 matchboxes, each of which should contain at least 60 sticks)
sample_1 <- c(63, 63, 64, 62, 65, 59, 61, 62, 60, 60)
sample_2 <- c(59, 62, 59, 58, 59, 53, 76, 69, 54, 59)
sample_3 <- c(59, 63, 54, 63, 59, 67, 62, 54, 59, 58)

full_sample <- c(sample_1, sample_2, sample_3)

#The boxes were not enough, and I augmented the data using bootstrapping
bootstrapping <- function() {
  samples <- c()
  for(time in 1:10000) {
    temp <- sample(full_sample, 20, replace = TRUE)
    samples <- c(samples, mean(temp))
  }
  return(samples)
}

samples <- bootstrapping()

#I then generated a random normal distribution using the parameters from the bootstrapping, to confirm that indeed they could generate
#the sticks that I bought earlier.
rands <- rnorm(1000000, 60, sd(samples))

df <- data.frame(rands)

ggplot(data=df, aes(x=rands)) + geom_histogram(binwidth=.5) + ggtitle("How likely is it that each matchbox contains 60 sticks?") + 
  xlab("Expected number of sticks") +
  ylab("Frequency") +
  geom_vline(xintercept = mean(samples), col="red")

ggsave('./experiment.png')

#The p-value can be computed as
mean(rands < mean(samples))

#I obtained a p-value of 0.79, and this supports the claim that matchboxes in Nairobi contain at least 60 sticks
