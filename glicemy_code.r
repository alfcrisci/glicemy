library(xts)
library(lubridate)
library(dygraphs)
library(htmlwidgets)
library(webshot)

#setwd("/home/alf/Scrivania/lav_mauro")

# read and purge data 

dati_mauro=read.csv("dati_mauro_corr.csv")

dati_mauro=dati_mauro[-which(dati_mauro$GLUCO_mgL==0),]

# create index time vector

time_mauro=ymd_hm(dati_mauro$Ora,tz="CET")

# create time vector object

ts_mauro_glu=xts(glucosio=dati_mauro$GLUCO_mgL,time_mauro)

# create a htmlwidget

mau=dygraph(ts_mauro_glu,ylab="Glucosio ematico mg/dL")

# save  htmlwidget

saveWidget(mau,"index.html",selfcontained = T)

