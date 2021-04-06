library(ggplot2)

points <- rep(c('lowest', 'highest'), 3)
countries <- c(rep('Kenya', 2), rep('Uganda', 2), rep('Tanzania',2), rep('Rwanda', 2), rep('Burundi', 2), rep('Ethiopia', 2), 
               rep('South Sudan', 2), rep('Eritrea', 2), rep('Somalia', 2))
values <- c(0, 5197, 621, 5110, 0, 5895, 950, 4507, 772, 2684, -125, 4533, 381, 3187, -75, 3018, 0, 2460 )

terrain <- data.frame(points, countries, values)

terrain

p <- function(){
  ggplot(data = terrain, aes(x = points, y = values, group = countries)) +
    geom_line(aes(color = countries), size = 2) +
    geom_point(aes(color = countries), size = 4) +
    labs(
      title = "East Africa Highest and Lowest points",
      subtitle = "(All values in meters)"
    ) + 
    xlab("Highest and lowest points") +
    ylab("Height")
  
  ggsave(filename = "/home/collins/Documents/dev/mine/lab/r/30-day-challenge/eaTerrain.png")
}

p()
