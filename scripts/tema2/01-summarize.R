data <- read.csv("../../data/tema2/auto-mpg.csv", 
                header = TRUE,
                stringsAsFactors = FALSE)

data$cylinders <- factor(data$cylinders,  #Pasamos esta columna a variable categórica
                         levels = c(3,4,5,6,8),
                         labels = c("3cil", "4cil", "5cil", "6cil", "8cil"))

summary(data) #resumen inicial

str(data) # nos da una idea de como ha montado R la estructura para analizar el data frame

summary(data$cylinders) #sólo una columna, (en este caso devuelve una tabla de frecuencias absolutas)
str(data$cylinders)


install.packages(c("modeest", "raster", "moments"))
library(modeest) #moda
library(raster) #quantiles, cv
library(moments)
