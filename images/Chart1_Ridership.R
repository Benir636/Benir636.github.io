require(ggplot2)
require(scales)
source('Theme.R')
require(tidyr)
require(dplyr)

table <- read.csv('Subway_Data_by_Line.csv', stringsAsFactors = FALSE)

#grabing line, ridership, sgr, borough, income
table_subset <- subset(table,select=c(4,8,11,18,22))

chart_ridership <- ggplot(table_subset,aes(x=Subway_Letter,y=Ridership))+
  geom_bar(stat="identity")+
  scale_y_continuous(limits=c(0,300000000), breaks=c(0,50000000,100000000,150000000,200000000,250000000,300000000))+
  RenataTheme+
  facet_wrap(~Boro_Name,ncol=2)+
  ggtitle("Ridership Along Subway Lines in 2014")+
  xlab("Subway Lines")+
  ylab("Annual Ridership")

print(chart_ridership)