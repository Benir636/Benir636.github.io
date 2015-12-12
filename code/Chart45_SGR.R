require(ggplot2)
require(scales)
source('Theme.R')
require(tidyr)
require(dplyr)

table <- read.csv('Subway_Data_by_Line.csv', stringsAsFactors = FALSE)
table$Med_Income <- as.numeric(table$Med_Income)
mean(table$Med_Income, na.rm=TRUE)

table$Not_in_SGR_Perc <- as.numeric(table$Not_in_SGR_Perc)
mean(table$Not_in_SGR_Perc, na.rm=TRUE)

#grabing line, station, ridership, sgr, sgr_class, borough, income
table_subset <- subset(table,select=c(4,6,8,11,12,18,22))

chart_sgr_income <- ggplot(table_subset,aes(x=Not_in_SGR_Perc,y=Med_Income))+
  geom_point()+
  scale_x_continuous(limits=c(0,1), breaks=c(0,.05,.1,.2,.3,.4,.5,.6,.7,.8,.9,1))+
  facet_wrap(~Boro_Name,ncol=2)+
  geom_smooth(method="lm")+
  RenataTheme+
  ggtitle("SGR vs Income by Station")+
  xlab("SGR")+
  ylab("Income")

print(chart_sgr_income)