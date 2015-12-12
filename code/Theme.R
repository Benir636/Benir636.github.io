require('ggplot2')
require('grid')

RenataTheme <- theme(
  
  #dark gray grid lines with light background
  panel.grid.major = element_line(color = '#CDCDCD'),
  panel.background = element_rect(fill = '#F0F0F0'),
  
  #remove tickmarks and minor grid lines
  axis.ticks = element_blank(),
  panel.grid.minor = element_blank(),
  
  #tuck labels close to grid
  axis.ticks.margin = unit(0, 'points'),
  
  #add padding to chart and make background light gray
  plot.margin = unit(c(40, 30, 40, 30), 'point'),
  plot.background = element_rect(fill = '#F0F0F0'),
  
  #set default text settings
  text = element_text(family='Helvetica', color = '#3C3C3C', size = 10),
  title = element_text(family='Helvetica', face='bold'),
  
  #set axis text
  axis.text = element_text(family = 'Helvetica', color = '#3C3C3C', size = rel(1.6)),
  axis.title = element_text(size = rel(1.6)),
  
  #position titles and labels
  plot.title = element_text(hjust = 0,vjust = 3.5, size = rel(2.3)),
  axis.title.x = element_text(vjust = -1.5),
  axis.title.y = element_text(vjust = 2.5),
  
  #remove legend
  #legend.position = 'none',
  
  #style facet charts
  strip.text = element_text(size = rel(1.6), vjust = 0.5),
  strip.background = element_blank(),
  panel.margin = unit(0.03 , 'npc')
  
)