library(data.table)
library(dplyr)
library(lubridate)
setwd('/Users/michelle/Downloads/data/R in coursera/datascience/EDA')
## use paste() to paste the first 2 cols and use strptime()
hpc<-fread('household_power_consumption.txt')
hpc_sub<-filter(hpc,Date == '1/2/2007'|Date == '2/2/2007')
date_time <- dmy_hms(paste(hpc_sub$Date,hpc_sub$Time))
hpc_sub<-mutate(hpc_sub,date_time = date_time) #change the class of date and time to POXITt/POXITct to make graphs
par(mfrow = c(2,2))
#top_left
with(hpc_sub,plot(seq_along(date_time),Global_active_power,type = 'l',xaxt = 'n',xlab = '', ylab = "Global Active Power"))
axis(1,seq(0,nrow(hpc_sub),nrow(hpc_sub)/2),c('Thu','Fri','Sat'))
#top_right
with(hpc_sub,plot(seq_along(date_time),Voltage,type = 'l',xlab = 'datetime',ylab = 'Voltage',xaxt = 'n'))
axis(1,seq(0,nrow(hpc_sub),nrow(hpc_sub)/2),c('Thu','Fri','Sat'))
#under_l
##S_1
with(hpc_sub,plot(seq_along(date_time),as.numeric(Sub_metering_1),type = 'l',xaxt = 'n',xlab = '', ylab = 'Energy sub metering'))
axis(1,seq(0,nrow(hpc_sub),nrow(hpc_sub)/2),c('Thu','Fri','Sat')) ##start from 0!
par(new = TRUE) 
##S_2
plot(seq_along(hpc_sub$date_time),as.numeric(hpc_sub$Sub_metering_2),type = 'l',col = 'red',ylim = c(0,30),ann = FALSE,axes = FALSE)
par(new = TRUE) 
##S_3
plot(seq_along(hpc_sub$date_time),as.numeric(hpc_sub$Sub_metering_3),type = 'l',col = 'blue',ylim = c(0,30),ann = FALSE,axes = FALSE)
legend('topright',legend = c('Sub_metering_1','Sub_metering_2','Sub_metering_3'),col = c('black','red','blue'),lty = c(1,1,1),cex = 0.5)
#u_r
with(hpc_sub,plot(seq_along(date_time),Global_reactive_power,type = 'l',xlab = 'datetime',ylab = 'Global_reactive_power',xaxt = 'n'))
axis(1,seq(0,nrow(hpc_sub),nrow(hpc_sub)/2),c('Thu','Fri','Sat'))

dev.copy(png,'plot4.png')
dev.off()