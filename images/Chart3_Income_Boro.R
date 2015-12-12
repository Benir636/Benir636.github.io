require(ggplot2)
require(scales)
source('Theme.R')
require(tidyr)
require(dplyr)

table <- read.csv('Subway_Data_by_Line.csv', stringsAsFactors = FALSE)

table$Med_Income <- as.numeric(table$Med_Income)
mean(table$Med_Income, na.rm=TRUE)

chart_income_boro <- ggplot(table,aes(x=Boro_Name,y=Med_Income))+
  geom_boxplot()+
  scale_y_continuous(limits=c(0,250000))+
  RenataTheme+
  ggtitle("Income Along Subway Lines")+
  xlab("Borough")+
  ylab("Income by Census Tract")

print(chart_income_boro)