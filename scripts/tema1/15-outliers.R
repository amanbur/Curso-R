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
# Bigotes: Los bigotes siempre están como mucho a la distancia de 1.5 RI
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