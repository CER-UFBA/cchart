source("classical_function_chart.R")

s.min = read.csv("https://raw.githubusercontent.com/CER-UFBA/cchart/main/data/min_UR.csv", sep = " ")

plot.control(s.min$minima, type = 'unit', fase1 = .8, xlab = '', ylab = 'Umidade Relativa do Ar', 
             tit = ' ', size =  20, iter = 1000)
