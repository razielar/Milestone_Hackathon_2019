library(ggplot2)
library(ggthemr)
library(dplyr)
library(tibble)

dflist <- list()

for(k in 1:6){
  set.seed(k) 
  
  x=NULL
  x[1]=0
  for (i in 2:100) {
    x[i] = x[i-1] + rnorm(1,0,1)
  }
  y <- 1:length(x)

  dflist[[k]] <- data.frame(x = y,
                            y = x,
                            rack = paste0("Rack_", k),
                            stringsAsFactors = FALSE)
}

dflist <- bind_rows(dflist)


p1 <- ggplot(dflist, aes(x = x, y = y)) +
  theme_bw(base_size = 28) + 
  geom_line(aes(color = rack), size = 1.5) +
  ylab("Number of customers") + 
  xlab("Time") +
  labs(color = NULL)

ggsave(p1, file = "timegraph.png", width = 12, height = 6)





