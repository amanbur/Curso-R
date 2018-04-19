ozone.data <- read.csv("../../data/tema1/ozone.csv", stringsAsFactors = FALSE)

outlier_values <- boxplot(ozone.data$pressure_height)$out

boxplot(ozone.data$pressure_height, 
        main = "Pressure Height",
        boxwex = 1.1) #Tamaño caja

summary(ozone.data$pressure_height)

#######
# Línea central  en la caja más ancha : mediana
#
# Arriba 3 cuartil Q3
# Abajo 1er cuartil Q1
# Rango intercuartílico (RI): altura de la caja 
#
# Bigotes: Los bigotes siempre están como mucho a la distancia de 1.5 RI, a partir de ahí son outliers
#
#

boxplot(pressure_height ~ Month,
        data = ozone.data,  # El dataframe lo indicamos aquí y no hay que ponerlo en cada columna
        main = "Presure Height per Month"
        )

boxplot(ozone_reading ~Month,
        data = ozone.data,
        main = "Ozone reading per Month")

boxplot(ozone_reading ~Month,
        data = ozone.data,
        main = "Ozone reading per Month")$out #Saca por consola los outliers 

mtext("Hola") #Escribe encima del gráfico

###################Reemplazar outliers###################

## reemplazamos por debajo el 5% y por encima del 95%
impute_outliers <- function(x, removeNA = TRUE){
    quantiles <- quantile(x, c(0.05, 0.95), na.rm = removeNA)
    x[x<quantiles[1]] <-mean(x, na.rm = removeNA)
    x[x>quantiles[2]] <-median(x, na.rm = removeNA)
    x
}

imputed_data <- impute_outliers(ozone.data$pressure_height)

par(mfrow = c(1,2)) #ordenar gráficos uno al lado de otro

boxplot(ozone.data$pressure_height, main = "Presión con outliers")
boxplot(imputed_data, main =  "Presión sin outliers")

##Capar outliers

#subsituir outlier por el percentil 5 o el percentil 95 respectivamente
replace_outliers <- function(x, removeNA = TRUE){
  qrts <- quantile(x, 
                   probs = c(0.25, 0.75), 
                   na.rm = removeNA)
  caps <- quantile(x, 
                   probs = c(0.05, 0.95),
                   na.rm = removeNA)
  
  iqr <- qrts[2]-qrts[1] #interquantilic range
  h <- 1.5 * iqr # Calulamos los bigotes
  x[x<qrts[1]-h]<- caps[1]
  x[x>qrts[2]+h]<-caps[2]
  x
  
}

capped_pressure_height <- replace_outliers(ozone.data$pressure_height)

par(mfrow = c(1,2))

boxplot(ozone.data$pressure_height, main = "Presión con outliers")
boxplot(capped_pressure_height, main = "Presión sin outliers")








