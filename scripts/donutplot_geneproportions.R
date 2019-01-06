library(RColorBrewer)
library(tidyverse)

# load GGplot2
library(ggplot2)
library(svglite)
# Add data.
dat = data.frame(count=c(7, 23, 36, 9, 18, 5, 13), 
                 Function=c("Other", 
                            "Membrane", 
                            "Metabolism", 
                            "Motility", 
                            "Stress Response",
                            "Transcription", 
                            "Unknown"))

# Add addition columns, needed for drawing with geom_rect.
dat$fraction = dat$count / sum(dat$count)
dat = dat[order(dat$fraction), ]
dat$ymax = cumsum(dat$fraction)
dat$ymin = c(0, head(dat$ymax, n=-1))

# Make the plot
p0 = ggplot(dat, aes(fill=Function, ymax=ymax, ymin=ymin, xmax=4, xmin=3)) +
  geom_rect() +
  coord_polar(theta="y") +
  xlim(c(0, 4)) +
  theme(panel.grid=element_blank()) +
  theme(axis.text=element_blank()) +
  theme(axis.ticks=element_blank()) +
  theme_void() 

p0
