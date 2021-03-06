data <- read.csv("../../data/tema1/missing-data.csv", na.strings="") ##Rellenamos los huecos con NA

View(data)

data.cleaned <- na.omit(data) ##Elimina las filas con NA

View(data.cleaned)

is.na(data[4,2]) #Comprueba si hay na
is.na(data$Income) #Toda la columna income

data.income.cleaned <- data[!is.na(data$Income),] #Todas las columnas pero s�lo las filas d�nde income no sea na


#Dice si las filas est�n completas
complete.cases(data)

data.cleaned.2 <- data[complete.cases(data),] ## igual a data.cleaned <- na.omit(data)

#A veces no es un na pero encontramos valores que indican lo mismo , por ejemplo un cero podr�a significar que no
#tenemos el valor

#Convertir los  ceros de ingresos en NA
data$Income[data$Income == 0] <- NA

#Medidas de centralizaci�n y dispersi�n
mean(data$Income) #Promedio (esto devuelve NA porque hay datos NA no procesables)

mean(data$Income, na.rm = TRUE)

sd(data$Income) #desviaci�n t�pica
sd(data$Income, na.rm = TRUE)
