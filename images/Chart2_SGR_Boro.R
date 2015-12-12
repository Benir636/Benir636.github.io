require(ggplot2)
require(scales)
source('Theme.R')
require(tidyr)
require(dplyr)

table <- read.csv('Subway_Data_by_Station.csv', stringsAsFactors = FALSE)

#grabing line, ridership, sgr, sgr_class, borough, income
table_subset <- subset(table,select=c(14,18))

table_subset <- subset(table_subset, SGR_Class !="")

#brooklyn <- filter(table_subset, BoroName == 'Brooklyn')
summed <- summarise(group_by(table_subset,BoroName,SGR_Class), count = n())
summed <- mutate(summed, total = sum(count))
summed <- mutate(summed, perc = (count/total))

chart_sgr_boro <- ggplot(summed,aes(x=BoroName,y=perc, fill =SGR_Class ))+
  geom_bar(stat="identity",position = "stack")+
  RenataTheme+
  ggtitle("Stations State of Good Repair by Borough")+
  xlab("Borough")+
  ylab("Percentage of Stations Not in State of Good Repair")

print(chart_sgr_boro)