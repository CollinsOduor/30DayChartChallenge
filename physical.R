library(ggplot2)

key <- rep(c('fresh', 'salty'), 2)
values <- c(0.41, 0.33, 288, 498)

df <- data.frame(key, values)
df

ggplot(df, aes(x=key, y=values)) +
  geom_dotplot(binaxis='y', stackdir='center') +
  ylab('Length of fish in inches') +
  xlab('Type of water') +
  ggtitle('Variability of fish length based on habitat') +
  geom_line(size=1.2)
  
ggsave('./physical.png')