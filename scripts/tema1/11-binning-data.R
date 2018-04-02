students <- read.csv("../../data/tema1/data-conversion.csv")

bp <- c(-Inf, 10000, 31000,  Inf) #breakpoints, rangos para luego darle un valor categórico

names <-c("Low", "Medium", "High") #valores categóricos 

students$Income.cat <- cut(students$Income,              #funcion corte, vamos a categorizar los 
                          breaks = bp, labels = names)   #ingresos en 3 rangos

students$Income.cat2 <- cut(students$Income, breaks = bp) #sin nombre, lo genera R (el intervalo)

#Cut puede gestionar los puntos de corte (anchura equitativa)
students$Income.cat3 <- cut(students$Income, 
                            breaks = 4, 
                            labels = c("Level 1", "Level 2", "Level 3", "Level 4")
                            )
students$Income.cat4 <- cut(students$Income, 
                            breaks = 4)

#Variables ficticias para categorizaciones, dummy variables
students <- read.csv("../../data/tema1/data-conversion.csv")

install.packages("dummies")
library(dummies)

students.dummy <- dummy.data.frame(students, sep="") # creamos variables ficticias sobre el df students
#Se puede indicar que sólo muestre las vars. dummy [all=FALSE]

#Sólo en una de las columnas
dummy(students$State, sep=".")

dummy.data.frame(students, names =  c("State", "Gender"), sep = ".")

