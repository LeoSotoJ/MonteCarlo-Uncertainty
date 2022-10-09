library(ggplot2)

n <- readline(prompt="Iteraciones?")
n <- as.integer(n)
COT_v<-NULL
COT_d<-NULL
iteracion<-NULL

#TOC calculation

A_CT<-20000
b_CT<-8.092
m_CT<-1051.3
F_RecupCT<-1.111
F_MatrizCT<-1.111
A_CI<-14000
b_CI<-1814.5
m_CI<-1167
F_RecupCI<-1.111
F_MatrizCI<-1.111
F_dil<-2
B_CT<-0.1
B_CI<-0.3

COT<-(((A_CT-b_CT)/m_CT)*F_RecupCT*F_MatrizCT-((A_CI-b_CI)/m_CI)*F_RecupCI*F_MatrizCI)*F_dil+(B_CI-B_CT)

'The total organic carbon mg/L in the samples is:'

# "Iterations to estimate the uncertainty"

for (i in 1:n){
  
  A_CT<-rnorm(1, mean=20000, sd=1000) 
  b_CT<-rnorm(1, mean=8.0924, sd=0.80924)
  m_CT<-rnorm(1, mean=1051.3, sd=52.565)
  F_RecupCT<-rnorm(1, mean=1.111, sd=0.02222)
  F_MatrizCT<-rnorm(1, mean=1.111, sd=0.05556)
  A_CI<-rnorm(1, mean=14000, sd=700)
  b_CI<-rnorm(1, mean=1814.5, sd=181.45)
  m_CI<-rnorm(1, mean=1167, sd=116.7)
  F_RecupCI<-rnorm(1, mean=1.111, sd=0.02222)
  F_MatrizCI<-rnorm(1, mean=1.111, sd=0.05556)
  F_dil<-rnorm(1, mean=2, sd=0.01)
  B_CT<-rnorm(1, mean=0.1, sd=0.01)
  B_CI<-rnorm(1, mean=0.3, sd=0.03)
  
  y<-(((A_CT-b_CT)/m_CT)*F_RecupCT*F_MatrizCT-((A_CI-b_CI)/m_CI)*F_RecupCI*F_MatrizCI)*F_dil+(B_CI-B_CT)
  
  COT_v<-c(COT_v,y)
}

hist(COT_v)

print(paste("TOC in the sample mg/L is:", COT))

print(paste("The estimated uncertainty mg/L is:", sd(COT_v)))

