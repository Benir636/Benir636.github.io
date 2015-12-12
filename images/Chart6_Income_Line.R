require(ggplot2)
require(scales)
source('Theme.R')
require(tidyr)
require(dplyr)

table <- read.csv('Subway_Data_by_Line.csv', stringsAsFactors = FALSE)
table$Med_Income <- as.numeric(table$Med_Income)
mean(table$Med_Income, na.rm=TRUE)

#grabing line, ridership, sgr, borough, income
table_subset <- subset(table,select=c(4,8,11,18,22))

chart_income <- ggplot(table_subset,aes(x=Subway_Letter,y=Med_Income, color=Boro_Name))+
  geom_boxplot()+
  scale_y_continuous(limits=c(0,150000), breaks=c(0,25000,50000,75000,100000,125000,150000))+
  RenataTheme+
  facet_wrap(~Boro_Name,ncol=2)+
  ggtitle("Income Along Subway Lines")+
  xlab("Borough")+
  ylab("Income by Census Tract")

print(chart_income)