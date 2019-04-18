library(data.table)
library(dplyr)
library(lubridate)
setwd('/Users/michelle/Downloads/data/R in coursera/datascience/EDA')
## use paste() to paste the first 2 cols and use strptime()
hpc<-fread('household_power_consumption.txt')
hpc_sub<-filter(hpc,Date == '1/2/2007'|Date == '2/2/2007')
date_time <- dmy_hms(paste(hpc_sub$Date,hpc_sub$Time))
hpc_sub<-mutate(hpc_sub,date_time = date_time) #change the class of date and time to POXITt/POXITct to make graphs
with(hpc_sub,plot(seq_along(hpc_sub$date_time),Global_active_power,type = 'l',xaxt = 'n',xlab = '', ylab = "Global Active Power"))
axis(1,seq(0,nrow(hpc_sub),nrow(hpc_sub)/2),c('Thu','Fri','Sat'))
dev.copy(png,'plot2.png')
dev.off()
## 依旧没搞懂as.date()和strptime()怎么用，改plot1.R
